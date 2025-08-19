#!/usr/bin/env ruby

# Post-generation script to add debug logging capabilities to the Ruby SDK
# This script adds:
# 1. Debug logging configuration option to SDK
# 2. Faraday logger middleware activation
# 3. Request/response body logging capabilities
# 4. Environment variable support for easy debugging

require 'fileutils'

class DebugLoggingAdder
  def initialize(sdk_path = '.')
    @sdk_path = sdk_path
    @fixes_applied = []
    @errors_found = []
  end

  def run
    puts "🔧 Adding debug logging capabilities to Ruby SDK..."
    
    add_debug_config_to_sdk_configuration
    add_debug_initialization_to_openapisdk
    enable_faraday_logger
    add_debug_logging_documentation
    
    print_summary
  end

  private

  def add_debug_config_to_sdk_configuration
    puts "📁 Adding debug configuration to SDKConfiguration..."
    
    config_file = File.join(@sdk_path, 'lib/kintsugi_sdk/sdkconfiguration.rb')
    return unless File.exist?(config_file)
    
    content = File.read(config_file)
    original_content = content.dup
    
    # Add debug_logging attribute
    unless content.include?('attr_accessor :debug_logging')
      # Add after the timeout accessor
      content.gsub!(/(sig { returns\(T\.nilable\(Float\)\) }\s+attr_accessor :timeout)/, 
        "\\1\n\n    sig { returns(T.nilable(T::Boolean)) }\n    attr_accessor :debug_logging")
      
      @fixes_applied << "Added debug_logging attribute to SDKConfiguration"
    end

    # Add debug_logging parameter to initialize method signature
    unless content.include?('debug_logging: T.nilable(T::Boolean)')
      content.gsub!(/(\s+params\(\s+client: T\.nilable\(Faraday::Connection\),[\s\S]*?server_idx: T\.nilable\(Integer\))(\s+\)\.void)/, 
        "\\1,\n        debug_logging: T.nilable(T::Boolean)\\2")
      
      @fixes_applied << "Added debug_logging parameter to SDKConfiguration initialize signature"
    end

    # Add debug_logging parameter to initialize method
    unless content.include?('debug_logging = nil')
      content.gsub!(/(def initialize\(client, hooks, retry_config, timeout_ms, security, security_source, server_url, server_idx)(\))/, 
        "\\1, debug_logging = nil\\2")
      
      @fixes_applied << "Added debug_logging parameter to SDKConfiguration initialize method"
    end

    # Add debug_logging assignment in initialize method
    unless content.include?('@debug_logging =')
      # Find the end of the initialize method and add before the last line
      content.gsub!(/(def initialize.*?@user_agent = 'speakeasy-sdk\/ruby.*?')(\s+end)/m, 
        "\\1\n      @debug_logging = debug_logging.nil? ? (ENV['KINTSUGI_DEBUG'] == 'true') : debug_logging\\2")
      
      @fixes_applied << "Added debug_logging assignment with environment variable fallback"
    end

    if content != original_content
      File.write(config_file, content)
    end
  end

  def add_debug_initialization_to_openapisdk
    puts "🏗️  Adding debug logging initialization to OpenApiSDK..."
    
    openapisdk_file = File.join(@sdk_path, 'lib/kintsugi_sdk/openapisdk.rb')
    return unless File.exist?(openapisdk_file)
    
    content = File.read(openapisdk_file)
    original_content = content.dup
    
    # Add debug_logging parameter to initialize method signature
    unless content.include?('debug_logging: T.nilable(T::Boolean)')
      content.gsub!(/(\s+params\([\s\S]*?url_params: T\.nilable\(T::Hash\[Symbol, String\]\))(\s+\)\.void)/, 
        "\\1,\n        debug_logging: T.nilable(T::Boolean)\\2")
      
      @fixes_applied << "Added debug_logging parameter to OpenApiSDK initialize signature"
    end

    # Add debug_logging parameter to initialize method
    unless content.include?('debug_logging: nil')
      content.gsub!(/(def initialize\(client: nil, retry_config: nil, timeout_ms: nil, security: nil, security_source: nil, server_idx: nil, server_url: nil, url_params: nil)(\))/, 
        "\\1, debug_logging: nil\\2")
      
      @fixes_applied << "Added debug_logging parameter to OpenApiSDK initialize method"
    end

    # Update SDKConfiguration call to include debug_logging
    unless content.include?('debug_logging')
      content.gsub!(/(SDKConfiguration\.new\(\s+client,\s+hooks,\s+retry_config,\s+timeout_ms,\s+security,\s+security_source,\s+server_url,\s+server_idx)(\s+\))/, 
        "\\1,\n        debug_logging\\2")
      
      @fixes_applied << "Updated SDKConfiguration call to include debug_logging"
    end

    if content != original_content
      File.write(openapisdk_file, content)
    end
  end

  def enable_faraday_logger
    puts "🔄 Enabling Faraday logger middleware..."
    
    openapisdk_file = File.join(@sdk_path, 'lib/kintsugi_sdk/openapisdk.rb')
    return unless File.exist?(openapisdk_file)
    
    content = File.read(openapisdk_file)
    original_content = content.dup
    
    # Store the debug_logging variable for use in the closure
    logger_setup = <<~RUBY
          
          # Store debug setting for use in Faraday configuration
          debug_enabled = debug_logging == true || ENV['KINTSUGI_DEBUG'] == 'true'
          
          client ||= Faraday.new(**connection_options) do |f|
            f.request :multipart, {}
            f.response :logger, $stdout, { headers: true, bodies: true, errors: true } if debug_enabled
          end
    RUBY
    
    # Replace the entire client creation block
    content.gsub!(/client \|\|= Faraday\.new\(\*\*connection_options\) do \|f\|\s+f\.request :multipart, \{\}\s+# f\.response :logger, nil, \{ headers: true, bodies: true, errors: true \}\s+end/, 
      logger_setup.strip)
    
    if content != original_content
      File.write(openapisdk_file, content)
      @fixes_applied << "Enabled conditional Faraday logger in OpenApiSDK"
    end
  end

  def add_debug_logging_documentation
    puts "📖 Adding debug logging documentation to README..."
    
    readme_path = File.join(@sdk_path, 'README.md')
    return unless File.exist?(readme_path)
    
    content = File.read(readme_path)
    original_content = content.dup
    
    # Add debug logging to table of contents
    unless content.include?('* [Debug Logging](#debug-logging)')
      content.gsub!(/(  \* \[Server Selection\]\(#server-selection\))(\s+\* \[Development\]\(#development\))/m, 
        "\\1\n  * [Debug Logging](#debug-logging)\\2")
      
      @fixes_applied << "Added Debug Logging to table of contents"
    end
    
    # Add debug logging section
    debug_section = <<~DEBUG_DOCS
      <!-- Start Debug Logging [debugging] -->
      ## Debug Logging

      The SDK provides comprehensive debug logging capabilities to help you troubleshoot API requests and responses. When enabled, debug logging will output detailed information about HTTP requests and responses, including headers and body content.

      ### Enabling Debug Logging

      You can enable debug logging in two ways:

      #### Method 1: SDK Initialization Parameter

      Pass `debug_logging: true` when initializing the SDK:

      ```ruby
      require 'kintsugi_sdk'

      Models = ::KintsugiSDK::Models
      s = ::KintsugiSDK::OpenApiSDK.new(
        debug_logging: true,
        security: Models::Shared::Security.new(
          api_key_header: '<YOUR_API_KEY_HERE>',
        ),
      )

      # All API calls will now log request/response details
      req = Models::Shared::AddressBase.new(
        phone: '555-123-4567',
        street_1: '1600 Amphitheatre Parkway',
        city: 'Mountain View',
        state: 'CA',
        postal_code: '94043',
        country: Models::Shared::CountryCodeEnum::US,
      )

      res = s.address_validation.search(request: req)
      ```

      #### Method 2: Environment Variable

      Set the `KINTSUGI_DEBUG` environment variable to `true`:

      ```bash
      export KINTSUGI_DEBUG=true
      ruby your_script.rb
      ```

      Or inline:

      ```bash
      KINTSUGI_DEBUG=true ruby your_script.rb
      ```

      ### Debug Output

      When debug logging is enabled, you'll see detailed output like this:

      ```
      D, [2024-01-15T10:30:45.123456 #12345] DEBUG -- : --> POST https://api.trykintsugi.com/v1/address-validation/search
      D, [2024-01-15T10:30:45.123456 #12345] DEBUG -- : Content-Type: "application/json"
      D, [2024-01-15T10:30:45.123456 #12345] DEBUG -- : Authorization: "Bearer ***"
      D, [2024-01-15T10:30:45.123456 #12345] DEBUG -- : 
      D, [2024-01-15T10:30:45.123456 #12345] DEBUG -- : {"phone":"555-123-4567","street_1":"1600 Amphitheatre Parkway"...}
      D, [2024-01-15T10:30:45.234567 #12345] DEBUG -- : 
      D, [2024-01-15T10:30:45.234567 #12345] DEBUG -- : <-- 200 https://api.trykintsugi.com/v1/address-validation/search
      D, [2024-01-15T10:30:45.234567 #12345] DEBUG -- : Content-Type: "application/json"
      D, [2024-01-15T10:30:45.234567 #12345] DEBUG -- : 
      D, [2024-01-15T10:30:45.234567 #12345] DEBUG -- : {"validated_address":{"street_1":"1600 Amphitheatre Pkwy"...}}
      ```

      ### Security Note

      ⚠️ **Important**: Debug logging outputs request and response bodies, which may contain sensitive information like API keys, personal data, or other confidential information. Only enable debug logging in development environments and ensure debug logs are not exposed in production systems.

      ### Disabling Debug Logging

      Debug logging is disabled by default. To explicitly disable it:

      ```ruby
      s = ::KintsugiSDK::OpenApiSDK.new(
        debug_logging: false,  # Explicitly disabled
        security: Models::Shared::Security.new(
          api_key_header: '<YOUR_API_KEY_HERE>',
        ),
      )
      ```

      Or unset the environment variable:

      ```bash
      unset KINTSUGI_DEBUG
      ```
      <!-- End Debug Logging [debugging] -->

    DEBUG_DOCS
    
    # Insert debug section before the Development section
    unless content.include?('<!-- Start Debug Logging [debugging] -->')
      # Try to find the placeholder first, otherwise insert before Development section
      if content.include?('<!-- Placeholder for Future Speakeasy SDK Sections -->')
        content.gsub!(/<!-- Placeholder for Future Speakeasy SDK Sections -->\s*\n/, 
          "#{debug_section}\n")
      else
        # Insert before the Development section as fallback
        content.gsub!(/(<!-- End Server Selection \[server\] -->)\s*\n\s*(# Development)/m, 
          "\\1\n\n#{debug_section}\\2")
      end
      
      @fixes_applied << "Added debug logging documentation section to README"
    end
    
    if content != original_content
      File.write(readme_path, content)
    end
  end

  def print_summary
    puts "\n✅ Debug logging addition complete!"
    
    if @fixes_applied.any?
      puts "\n🔧 Fixes applied:"
      @fixes_applied.each { |fix| puts "  • #{fix}" }
    else
      puts "\n✨ No fixes needed - debug logging already configured!"
    end
    
    if @errors_found.any?
      puts "\n⚠️  Errors encountered:"
      @errors_found.each { |error| puts "  • #{error}" }
    end
    
    puts "\n📝 Debug logging capabilities added to Ruby SDK!"
    puts "   Users can now enable debug logging by:"
    puts "   1. Passing debug_logging: true to SDK initialization"
    puts "   2. Setting KINTSUGI_DEBUG=true environment variable"
    puts "   3. Both request and response bodies will be logged to stdout"
    puts "   4. Complete documentation added to README.md"
  end
end

# Run the debug logging adder if this script is executed directly
if __FILE__ == $0
  sdk_path = ARGV[0] || '.'
  
  unless Dir.exist?(File.join(sdk_path, 'lib/kintsugi_sdk'))
    puts "❌ Error: Ruby SDK not found at #{sdk_path}"
    puts "Usage: #{$0} [path_to_ruby_sdk]"
    exit 1
  end
  
  adder = DebugLoggingAdder.new(sdk_path)
  adder.run
end
