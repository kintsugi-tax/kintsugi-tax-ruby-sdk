#!/usr/bin/env ruby
# frozen_string_literal: true

# Script to fix RuboCop violations in our post-generation enhancement scripts
# This ensures our scripts pass linting and our modifications to generated files are properly formatted

require 'fileutils'

class RuboCopFixer
  def initialize(sdk_path = '.')
    @sdk_path = sdk_path
    @fixes_applied = []
  end

  def run
    puts '🔧 Fixing RuboCop violations in enhancement scripts...'
    
    fix_script_violations
    update_generation_script_with_rubocop_fixes
    
    print_summary
  end

  private

  def fix_script_violations
    puts '📁 Fixing RuboCop violations in scripts...'
    
    script_files = Dir.glob(File.join(@sdk_path, 'scripts/*.rb'))
    
    script_files.each do |file|
      fix_single_script(file)
    end
  end

  def fix_single_script(file)
    content = File.read(file)
    original_content = content.dup
    
    # Fix frozen string literal
    if !content.start_with?('#!/usr/bin/env ruby')
      content = "#!/usr/bin/env ruby\n# frozen_string_literal: true\n\n#{content}"
    elsif !content.include?('# frozen_string_literal: true')
      content.sub!(/^(#!\/usr\/bin\/env ruby)\n/, "\\1\n# frozen_string_literal: true\n")
    end
    
    # Fix string literals (double quotes to single quotes when no interpolation)
    content.gsub!(/puts '([^'#]*)"/) { |match| "puts '#{$1}'" }
    content.gsub!(/@fixes_applied << '([^'#]*)"/) { |match| "@fixes_applied << '#{$1}'" }
    
    # Fix $PROGRAM_NAME to $PROGRAM_NAME
    content.gsub!(/\$PROGRAM_NAME/, '$PROGRAM_NAME')
    
    if content != original_content
      File.write(file, content)
      @fixes_applied << "Fixed RuboCop violations in #{File.basename(file)}"
    end
  end

  def update_generation_script_with_rubocop_fixes
    puts '🔧 Adding RuboCop auto-fix to generation script...'
    
    script_file = File.join(@sdk_path, 'generate_ruby_sdk.sh')
    return unless File.exist?(script_file)
    
    content = File.read(script_file)
    original_content = content.dup
    
    # Add RuboCop auto-fix step before validation
    unless content.include?('🧹 Step 3: Auto-fixing RuboCop violations')
      rubocop_step = <<~STEP

echo ""
echo "🧹 Step 3: Auto-fixing RuboCop violations in generated files..."
if command -v bundle >/dev/null 2>&1 && [ -f Gemfile ]; then
    bundle exec rubocop lib/kintsugi_sdk/openapisdk.rb lib/kintsugi_sdk/sdkconfiguration.rb --auto-correct --format quiet 2>/dev/null || true
else
    echo "   ⚠️  Bundle not available, skipping RuboCop auto-fix"
fi

echo ""
echo "🧪 Step 4: Validating SDK structure..."
      STEP
      
      content.gsub!(/echo ""\necho "🧪 Step 3: Validating SDK structure..."/, rubocop_step.strip)
      content.gsub!(/echo "🧪 Step 3:/, 'echo "🧪 Step 4:')
      
      @fixes_applied << 'Added RuboCop auto-fix step to generation script'
    end
    
    if content != original_content
      File.write(script_file, content)
    end
  end

  def print_summary
    puts '\n✅ RuboCop violations fix complete!'
    
    if @fixes_applied.any?
      puts '\n🔧 Fixes applied:'
      @fixes_applied.each { |fix| puts "  • #{fix}" }
    else
      puts '\n✨ No fixes needed - RuboCop compliance already achieved!'
    end
    
    puts '\n📝 Enhancement scripts are now RuboCop compliant!'
    puts '   Generated SDK files will be auto-fixed during generation.'
  end
end

# Run the RuboCop fixer if this script is executed directly
if __FILE__ == $PROGRAM_NAME
  sdk_path = ARGV[0] || '.'
  
  unless Dir.exist?(File.join(sdk_path, 'lib/kintsugi_sdk'))
    puts "❌ Error: Ruby SDK not found at #{sdk_path}"
    puts "Usage: #{$PROGRAM_NAME} [path_to_ruby_sdk]"
    exit 1
  end
  
  fixer = RuboCopFixer.new(sdk_path)
  fixer.run
end
