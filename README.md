# Kintsugi Tax

Developer-friendly & type-safe Ruby SDK specifically catered to leverage Kintsugi's tax API.

<div align="left">
    <a href="https://www.speakeasy.com/?utm_source=openapi&utm_campaign=ruby"><img src="https://custom-icon-badges.demolab.com/badge/-Built%20By%20Speakeasy-212015?style=for-the-badge&logoColor=FBE331&logo=speakeasy&labelColor=545454" /></a>
    <a href="https://opensource.org/licenses/MIT">
        <img src="https://img.shields.io/badge/License-MIT-blue.svg" style="width: 100px; height: 28px;" />
    </a>
</div>


<br /><br />
<!-- Start Summary [summary] -->
## Summary

Kintsugi Customer API: Publicly documented Kintsugi Customer API endpoints. The source (openapi/_source/openapi-master.json) is the platform spec filtered to the documented customer surface (openapi/customer-endpoints.json); scripts/build-specs.mjs re-applies that filter here. Do not edit by hand.
<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [Kintsugi Tax](#kintsugi-tax)
  * [SDK Installation](#sdk-installation)
  * [SDK Example Usage](#sdk-example-usage)
  * [Authentication](#authentication)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
  * [Debug Logging](#debug-logging)
* [Development](#development)
  * [Maturity](#maturity)
  * [Contributions](#contributions)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

The SDK can be installed using [RubyGems](https://rubygems.org/):

```bash
gem install kintsugi_sdk
```
<!-- End SDK Installation [installation] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
  api_key_header: '<YOUR_API_KEY_HERE>'
)

req = Models::Shared::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Shared::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043'
)
res = s.address_validation.search(request: req)

unless res.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->

<!-- Start Authentication [security] -->
## Authentication

### Per-Client Security Schemes

This SDK supports the following security scheme globally:

| Name             | Type   | Scheme  |
| ---------------- | ------ | ------- |
| `api_key_header` | apiKey | API key |

To authenticate with the API the `api_key_header` parameter must be set when initializing the SDK client instance. For example:
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
  api_key_header: '<YOUR_API_KEY_HERE>'
)

req = Models::Shared::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Shared::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043'
)
res = s.address_validation.search(request: req)

unless res.nil?
  # handle response
end

```
<!-- End Authentication [security] -->

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [AddressValidation](docs/sdks/addressvalidation/README.md)

* [search](docs/sdks/addressvalidation/README.md#search) - Search
* [suggestions](docs/sdks/addressvalidation/README.md#suggestions) - Suggestions

### [Customers](docs/sdks/customers/README.md)

* [list](docs/sdks/customers/README.md#list) - Get customers
* [create](docs/sdks/customers/README.md#create) - Create customer
* [get_by_external_id](docs/sdks/customers/README.md#get_by_external_id) - Get customer by external id
* [get](docs/sdks/customers/README.md#get) - Get customer by id
* [update](docs/sdks/customers/README.md#update) - Update customer
* [get_transactions](docs/sdks/customers/README.md#get_transactions) - Get transactions by customer id
* [create_transaction](docs/sdks/customers/README.md#create_transaction) - Create transaction by customer id

### [Exemptions](docs/sdks/exemptions/README.md)

* [list](docs/sdks/exemptions/README.md#list) - Get exemptions
* [create](docs/sdks/exemptions/README.md#create) - Create exemption
* [get](docs/sdks/exemptions/README.md#get) - Get exemption by id
* [get_attachments](docs/sdks/exemptions/README.md#get_attachments) - Get attachments for exemption
* [upload_certificate](docs/sdks/exemptions/README.md#upload_certificate) - Upload exemption certificate

### [Nexus](docs/sdks/nexus/README.md)

* [list](docs/sdks/nexus/README.md#list) - Get nexus for org

### [Products](docs/sdks/products/README.md)

* [get](docs/sdks/products/README.md#get) - Get product by id
* [update](docs/sdks/products/README.md#update) - Update product

### [TaxEstimation](docs/sdks/taxestimation/README.md)

* [estimate_tax](docs/sdks/taxestimation/README.md#estimate_tax) - Estimate tax

### [Transactions](docs/sdks/transactions/README.md)

* [list](docs/sdks/transactions/README.md#list) - Get transactions
* [create](docs/sdks/transactions/README.md#create) - Create transaction
* [get_by_external_id](docs/sdks/transactions/README.md#get_by_external_id) - Get transaction by external id
* [get_by_filing_id](docs/sdks/transactions/README.md#get_by_filing_id) - Get transactions by filing id
* [get_by_id](docs/sdks/transactions/README.md#get_by_id) - Get transaction by id
* [update](docs/sdks/transactions/README.md#update) - Update transaction

</details>
<!-- End Available Resources and Operations [operations] -->

<!-- Start Error Handling [errors] -->
## Error Handling

Handling errors in this SDK should largely match your expectations. All operations return a response object or raise an error.

By default an API error will raise a `Errors::APIError`, which has the following properties:

| Property       | Type                                    | Description           |
|----------------|-----------------------------------------|-----------------------|
| `message`     | *string*                                 | The error message     |
| `status_code`  | *int*                                   | The HTTP status code  |
| `raw_response` | *Faraday::Response*                     | The raw HTTP response |
| `body`        | *string*                                 | The response content  |

When custom error responses are specified for an operation, the SDK may also throw their associated exception. You can refer to respective *Errors* tables in SDK docs for more details on possible exception types for each operation. For example, the `search` method throws the following exceptions:

| Error Type                                                                  | Status Code | Content Type     |
| --------------------------------------------------------------------------- | ----------- | ---------------- |
| Models::Errors::ErrorResponse                                               | 401         | application/json |
| Models::Errors::BackendSrcAddressValidationResponsesValidationErrorResponse | 422         | application/json |
| Models::Errors::ErrorResponse                                               | 500         | application/json |
| Errors::APIError                                                            | 4XX, 5XX    | \*/\*            |

### Example

```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
  api_key_header: '<YOUR_API_KEY_HERE>'
)

begin
    req = Models::Shared::AddressBase.new(
      phone: '555-123-4567',
      street_1: '1600 Amphitheatre Parkway',
      street_2: 'Building 40',
      city: 'Mountain View',
      county: 'Santa Clara',
      state: 'CA',
      postal_code: '94043',
      country: Models::Shared::CountryCodeEnum::US,
      full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043'
    )
    res = s.address_validation.search(request: req)

    unless res.nil?
      # handle response
    end
rescue Models::Errors::ErrorResponse => e
  # handle e.container data
  raise e
rescue Models::Errors::BackendSrcAddressValidationResponsesValidationErrorResponse => e
  # handle e.container data
  raise e
rescue Models::Errors::ErrorResponse => e
  # handle e.container data
  raise e
rescue Errors::APIError => e
  # handle default exception
  raise e
end

```
<!-- End Error Handling [errors] -->

<!-- Start Server Selection [server] -->
## Server Selection

### Override Server URL Per-Client

The default server can be overridden globally by passing a URL to the `server_url (String)` optional parameter when initializing the SDK client instance. For example:
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
  server_url: 'https://api.trykintsugi.com',
  api_key_header: '<YOUR_API_KEY_HERE>'
)

req = Models::Shared::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Shared::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043'
)
res = s.address_validation.search(request: req)

unless res.nil?
  # handle response
end

```
<!-- End Server Selection [server] -->

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


# Development

## Maturity

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning usage
to a specific package version. This way, you can install the same version each time without breaking changes unless you are intentionally
looking for the latest version.

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation. 
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release. 

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=openapi&utm_campaign=ruby)

<!-- Placeholder for Future Speakeasy SDK Sections -->
