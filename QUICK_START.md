# 🚀 Quick Start: Ruby SDK Generation

**For SDK maintainers** - Complete workflow to generate and enhance the Kintsugi Ruby SDK.

## One-Command Generation

```bash
./generate_ruby_sdk.sh
```

That's it! This single command:
- ✅ Generates the Ruby SDK using Speakeasy
- ✅ Applies error handling fixes  
- ✅ Adds debug logging capabilities
- ✅ Validates the SDK structure
- ✅ Provides a ready-to-use SDK

## What You Get

### 🛡️ Enhanced Error Handling
- Proper Ruby `raise`/`rescue` exception handling
- No more `UncaughtThrowException` issues
- Standard Ruby error patterns

### 🔍 Debug Logging
- Request/response body logging
- Headers and error details
- Two activation methods:
  ```ruby
  # Method 1: Parameter
  sdk = KintsugiSDK::OpenApiSDK.new(debug_logging: true)
  
  # Method 2: Environment variable
  ENV['KINTSUGI_DEBUG'] = 'true'
  sdk = KintsugiSDK::OpenApiSDK.new
  ```

### 📖 Complete Documentation
- Updated README with debug logging instructions
- Security warnings and best practices
- Usage examples

## Manual Steps (If Needed)

```bash
# Generate base SDK
speakeasy run

# Apply all enhancements  
ruby scripts/post_generation_fixes.rb

# Or apply individually
ruby scripts/fix_error_handling.rb    # Error handling only
ruby scripts/add_debug_logging.rb     # Debug logging only
```

## Validation

The script automatically validates:
- Core SDK files are present
- Debug logging is properly integrated
- SDK structure is correct

## Troubleshooting

```bash
# Make scripts executable
chmod +x generate_ruby_sdk.sh scripts/*.rb

# Run with debug output
DEBUG=1 ./generate_ruby_sdk.sh
```

## For Detailed Information

See [SDK_GENERATION_WORKFLOW.md](SDK_GENERATION_WORKFLOW.md) for:
- Complete workflow documentation
- CI/CD integration examples  
- Troubleshooting guide
- Customization instructions
