#!/usr/bin/env ruby
# frozen_string_literal: true

# Post-generation script to fix Ruby SDK error handling issues
# This script fixes the UncaughtThrowException problem by:
# 1. Making all error classes inherit from StandardError
# 2. Replacing 'throw obj' with 'raise obj'
# 3. Fixing README documentation

require 'fileutils'

class ErrorHandlingFixer
  def initialize(sdk_path = '.')
    @sdk_path = sdk_path
    @fixes_applied = []
    @errors_found = []
  end

  def run
    puts '🔧 Fixing Ruby SDK error handling...'
    
    fix_error_classes
    fix_throw_statements
    fix_readme_documentation
    
    print_summary
  end

  private

  def fix_error_classes
    puts '📁 Fixing error class inheritance...'
    
    error_files = Dir.glob(File.join(@sdk_path, 'lib/kintsugi_sdk/models/errors/*.rb'))
    error_files.reject! { |f| f.end_with?('.rbi') } # Skip type files
    
    error_files.each do |file|
      next if File.basename(file) == 'apierror.rb' # APIError already inherits from StandardError
      
      content = File.read(file)
      original_content = content.dup
      
      # Pattern to match error class definitions that don't inherit from StandardError
      content.gsub!(/(\s+class\s+\w+)(\s+extend\s+T::Sig)/, '\1 < StandardError\2')
      
      if content != original_content
        File.write(file, content)
        @fixes_applied << "Fixed #{File.basename(file)} to inherit from StandardError"
      end
    end
  end

  def fix_throw_statements
    puts '🔄 Replacing \'throw obj\' with \'raise obj\'...'
    
    sdk_files = Dir.glob(File.join(@sdk_path, 'lib/kintsugi_sdk/*.rb'))
    sdk_files.reject! { |f| f.include?('models/') || f.include?('utils/') || f.include?('sdk_hooks/') }
    
    sdk_files.each do |file|
      content = File.read(file)
      original_content = content.dup
      
      # Replace 'throw obj' with 'raise obj'
      throw_count = content.scan(/throw obj/).length
      content.gsub!(/throw obj/, 'raise obj')
      
      if content != original_content
        File.write(file, content)
        @fixes_applied << "Fixed #{throw_count} 'throw obj' statements in #{File.basename(file)}"
      end
    end
  end

  def fix_readme_documentation
    puts '📖 Fixing README documentation...'
    
    readme_path = File.join(@sdk_path, 'README.md')
    return unless File.exist?(readme_path)
    
    content = File.read(readme_path)
    original_content = content.dup
    
    # Fix the error handling example in README
    # Look for the problematic patterns and replace them
    content.gsub!(/# handle \$e->\$container data\s*\n\s*throw \$e;/, '# handle error data\n  puts "Error: #{e.detail if e.respond_to?(:detail)}"')
    content.gsub!(/# handle \$e->\$container data\s*\n\s*raise e/, '# handle error data\n  puts "Error: #{e.detail if e.respond_to?(:detail)}"')
    
    # Fix duplicate rescue blocks
    content.gsub!(/rescue Models::Errors::ErrorResponse => e\s*\n\s*# handle e\.container data\s*\n\s*raise e\s*\nrescue Models::Errors::BackendSrc\w+ValidationErrorResponse => e\s*\n\s*# handle e\.container data\s*\n\s*raise e\s*\nrescue Models::Errors::ErrorResponse => e\s*\n\s*# handle e\.container data\s*\n\s*raise e/) do
      <<~RESCUE_BLOCK.chomp
        rescue Models::Errors::ErrorResponse => e
          # handle error response
          puts "Error: \#{e.detail}"
        rescue Models::Errors::BackendSrcAddressValidationResponsesValidationErrorResponse => e
          # handle validation error response
          puts "Validation Error: \#{e.detail}"
      RESCUE_BLOCK
    end
    
    if content != original_content
      File.write(readme_path, content)
      @fixes_applied << 'Fixed README.md error handling documentation'
    end
  end

  def print_summary
    puts '\n✅ Error handling fix complete!'
    
    if @fixes_applied.any?
      puts '\n🔧 Fixes applied:'
      @fixes_applied.each { |fix| puts "  • #{fix}" }
    else
      puts '\n✨ No fixes needed - error handling already correct!'
    end
    
    if @errors_found.any?
      puts '\n⚠️  Errors encountered:'
      @errors_found.each { |error| puts "  • #{error}" }
    end
    
    puts "\n📝 The Ruby SDK now properly handles exceptions using 'raise' and 'rescue'."
    puts '   Users can catch exceptions normally without UncaughtThrowException issues.'
  end
end

# Run the fixer if this script is executed directly
if __FILE__ == $PROGRAM_NAME
  sdk_path = ARGV[0] || '.'
  
  unless Dir.exist?(File.join(sdk_path, 'lib/kintsugi_sdk'))
    puts "❌ Error: Ruby SDK not found at #{sdk_path}"
    puts "Usage: #{$PROGRAM_NAME} [path_to_ruby_sdk]"
    exit 1
  end
  
  fixer = ErrorHandlingFixer.new(sdk_path)
  fixer.run
end
