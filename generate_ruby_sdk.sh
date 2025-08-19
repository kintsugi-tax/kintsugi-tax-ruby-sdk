#!/bin/bash

# Comprehensive Ruby SDK generation script
# This script:
# 1. Generates the Ruby SDK using Speakeasy
# 2. Applies all post-generation fixes (error handling, debug logging, etc.)
# 
# Usage: ./generate_ruby_sdk.sh

set -e  # Exit on any error

echo "🚀 Starting Ruby SDK generation pipeline..."
echo "=================================================="
echo ""

echo "📦 Step 1: Generating Ruby SDK with Speakeasy..."
speakeasy run

echo ""
echo "🔧 Step 2: Applying comprehensive post-generation fixes..."
echo "   • Error handling improvements"
echo "   • Debug logging capabilities"
echo "   • Additional SDK enhancements"
ruby scripts/post_generation_fixes.rb

echo ""
echo "🧹 Step 3: Auto-fixing RuboCop violations in generated files..."
if command -v bundle >/dev/null 2>&1 && [ -f Gemfile ]; then
    bundle exec rubocop lib/kintsugi_sdk/openapisdk.rb lib/kintsugi_sdk/sdkconfiguration.rb --auto-correct --format quiet 2>/dev/null || true
else
    echo "   ⚠️  Bundle not available, skipping RuboCop auto-fix"
fi

echo ""
echo "🧪 Step 4: Validating SDK structure..."
if [ -f "lib/kintsugi_sdk/openapisdk.rb" ] && [ -f "lib/kintsugi_sdk/sdkconfiguration.rb" ]; then
    echo "   ✅ Core SDK files present"
else
    echo "   ❌ Missing core SDK files"
    exit 1
fi

if grep -q "debug_logging" lib/kintsugi_sdk/sdkconfiguration.rb; then
    echo "   ✅ Debug logging integration verified"
else
    echo "   ❌ Debug logging integration failed"
    exit 1
fi

echo ""
echo "🎉 Ruby SDK generation pipeline completed successfully!"
echo "=================================================="
echo ""
echo "✨ Your Ruby SDK is now ready with enhanced features:"
echo "   • Proper exception handling (raise/rescue)"
echo "   • Debug logging capabilities (debug_logging: true or KINTSUGI_DEBUG=true)"
echo "   • Request/response body logging for troubleshooting"
echo ""
echo "📖 See README.md for usage examples and debugging instructions."
echo ""
