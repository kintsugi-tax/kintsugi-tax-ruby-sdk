# Ruby SDK Generation Workflow

This document outlines the complete workflow for generating and customizing the Kintsugi Ruby SDK using Speakeasy.

## Overview

Our SDK generation process includes automatic post-generation enhancements that provide better error handling and debugging capabilities beyond what Speakeasy generates by default.

## 🚀 Quick Start

For most users, simply run:

```bash
./generate_ruby_sdk.sh
```

This single command handles everything automatically.

## 📋 Detailed Workflow

### Step 1: Prerequisites

Ensure you have the following installed:
- **Speakeasy CLI**: For SDK generation
- **Ruby 2.6+**: For running post-generation scripts
- **Git**: For version control

### Step 2: SDK Generation Pipeline

The `generate_ruby_sdk.sh` script performs these steps automatically:

1. **Base SDK Generation**
   ```bash
   speakeasy run
   ```
   - Generates the Ruby SDK from OpenAPI specification
   - Creates base SDK structure with Speakeasy defaults

2. **Post-Generation Enhancements**
   ```bash
   ruby scripts/post_generation_fixes.rb
   ```
   - Applies error handling fixes (UncaughtThrowException → proper raise/rescue)
   - Adds debug logging capabilities with Faraday logger integration
   - Enhances SDK configuration with additional options

3. **Validation & Verification**
   - Verifies core SDK files are present
   - Confirms debug logging integration
   - Validates SDK structure integrity

## 🔧 Post-Generation Scripts

### Available Scripts

| Script | Purpose | Manual Usage |
|--------|---------|--------------|
| `post_generation_fixes.rb` | **Main script** - Runs all fixes | `ruby scripts/post_generation_fixes.rb` |
| `fix_error_handling.rb` | Error handling improvements only | `ruby scripts/fix_error_handling.rb` |
| `add_debug_logging.rb` | Debug logging capabilities only | `ruby scripts/add_debug_logging.rb` |

### Script Details

#### 1. Error Handling Fixes (`fix_error_handling.rb`)
- **Problem**: Speakeasy generates `throw obj` statements that cause `UncaughtThrowException`
- **Solution**: Converts to proper `raise obj` statements
- **Benefit**: Standard Ruby exception handling works correctly

#### 2. Debug Logging (`add_debug_logging.rb`)
- **Enhancement**: Adds conditional Faraday logger middleware
- **Configuration**: Supports both parameter and environment variable activation
- **Output**: Headers, request/response bodies, and error details

## 🛠️ Manual Workflow (Advanced)

If you need to run steps individually:

```bash
# 1. Generate base SDK
speakeasy run

# 2. Apply specific fixes
ruby scripts/fix_error_handling.rb        # Error handling only
ruby scripts/add_debug_logging.rb         # Debug logging only

# OR apply all fixes at once
ruby scripts/post_generation_fixes.rb     # All enhancements
```

## 🔄 CI/CD Integration

### GitHub Actions Example

```yaml
name: Generate Ruby SDK

on:
  workflow_dispatch:
  schedule:
    - cron: '0 2 * * *'  # Daily at 2 AM

jobs:
  generate-sdk:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.0'
          
      - name: Install Speakeasy CLI
        run: |
          curl -fsSL https://raw.githubusercontent.com/speakeasy-api/speakeasy/main/install.sh | sh
          
      - name: Generate Ruby SDK
        run: ./generate_ruby_sdk.sh
        working-directory: kintsugi-tax-ruby-sdk
        
      - name: Commit changes
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add .
          git commit -m "Auto-update Ruby SDK" || exit 0
          git push
```

## 📊 Validation & Testing

### Automated Checks

The generation script includes these validations:

1. **File Presence**: Verifies core SDK files exist
2. **Feature Integration**: Confirms debug logging is properly integrated
3. **Structure Integrity**: Validates SDK follows expected patterns

### Manual Testing

Test debug logging functionality:

```ruby
# Test environment variable method
ENV['KINTSUGI_DEBUG'] = 'true'
sdk = KintsugiSDK::OpenApiSDK.new

# Test parameter method  
sdk = KintsugiSDK::OpenApiSDK.new(debug_logging: true)

# Make an API call to see debug output
response = sdk.address_validation.search(request: address_data)
```

## 🔧 Troubleshooting

### Common Issues

1. **Script Permissions**
   ```bash
   chmod +x generate_ruby_sdk.sh
   chmod +x scripts/*.rb
   ```

2. **Missing Dependencies**
   ```bash
   # Install required gems
   bundle install
   
   # Or install manually
   gem install faraday sorbet-runtime
   ```

3. **Speakeasy CLI Issues**
   ```bash
   # Update Speakeasy CLI
   speakeasy upgrade
   
   # Check configuration
   speakeasy configure
   ```

### Debug Mode

Run scripts with verbose output:

```bash
# Enable debug output for generation script
DEBUG=1 ./generate_ruby_sdk.sh

# Run individual scripts with Ruby debug
ruby -d scripts/post_generation_fixes.rb
```

## 📝 Customization

### Adding New Post-Generation Fixes

1. Create a new script in `scripts/` directory
2. Follow the existing pattern (class-based, with summary output)
3. Add the script call to `post_generation_fixes.rb`
4. Update this documentation

### Modifying Existing Fixes

Edit the individual script files in `scripts/` directory. Changes will be automatically included in the next generation run.

## 🎯 Best Practices

1. **Always use the main generation script** (`generate_ruby_sdk.sh`) rather than manual steps
2. **Test thoroughly** after any changes to post-generation scripts
3. **Version control all scripts** to track customization changes
4. **Document any new enhancements** in this workflow file
5. **Validate SDK functionality** before releasing to users

## 📚 Related Documentation

- [README.md](README.md) - SDK usage and API documentation
- [RUBY_SDK_FIXES.md](RUBY_SDK_FIXES.md) - Detailed information about applied fixes
- [Debug Logging Section](README.md#debug-logging) - How to use debug logging features
