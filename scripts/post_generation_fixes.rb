#!/usr/bin/env ruby
# frozen_string_literal: true

# Comprehensive post-generation script for Ruby SDK
# This script applies all necessary patches to the generated SDK:
# 1. Error handling fixes
# 2. Debug logging capabilities
# 3. Any other future post-generation improvements

require 'fileutils'

class PostGenerationFixer
  def initialize(sdk_path = '.')
    @sdk_path = sdk_path
    @scripts_path = File.join(sdk_path, 'scripts')
  end

  def run
    puts '🚀 Running comprehensive post-generation fixes for Ruby SDK...'
    puts "📍 SDK Path: #{@sdk_path}"
    puts

    unless Dir.exist?(File.join(@sdk_path, 'lib/kintsugi_sdk'))
      puts "❌ Error: Ruby SDK not found at #{@sdk_path}"
      puts "Usage: #{$PROGRAM_NAME} [path_to_ruby_sdk]"
      exit 1
    end

    run_error_handling_fixes
    run_debug_logging_fixes
    
    puts '\n🎉 All post-generation fixes completed successfully!'
    puts '   Your Ruby SDK is now ready for use with enhanced error handling and debug logging capabilities.'
  end

  private

  def run_error_handling_fixes
    puts '🔧 Applying error handling fixes...'
    
    fix_script = File.join(@scripts_path, 'fix_error_handling.rb')
    
    if File.exist?(fix_script)
      system("ruby #{fix_script} #{@sdk_path}")
      puts '✅ Error handling fixes completed'
    else
      puts "⚠️  Error handling fix script not found at #{fix_script}"
    end
    
    puts
  end

  def run_debug_logging_fixes
    puts '🔧 Applying debug logging enhancements...'
    
    debug_script = File.join(@scripts_path, 'add_debug_logging.rb')
    
    if File.exist?(debug_script)
      system("ruby #{debug_script} #{@sdk_path}")
      puts '✅ Debug logging enhancements completed'
    else
      puts "⚠️  Debug logging script not found at #{debug_script}"
    end
    
    puts
  end
end

# Run the comprehensive fixer if this script is executed directly
if __FILE__ == $PROGRAM_NAME
  sdk_path = ARGV[0] || '.'
  
  fixer = PostGenerationFixer.new(sdk_path)
  fixer.run
end
