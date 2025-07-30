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


<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [Kintsugi Tax](#)
  * [SDK Installation](#sdk-installation)
  * [SDK Example Usage](#sdk-example-usage)
  * [Authentication](#authentication)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Error Handling](#error-handling)
* [Development](#development)
  * [Maturity](#maturity)
  * [Contributions](#contributions)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

The SDK can be installed using [RubyGems](https://rubygems.org/):

```bash
gem install specific_install
gem specific_install  
```
<!-- End SDK Installation [installation] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Components::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Components::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
)

res = s.address_validation.search(request: req, security: Models::Operations::SearchV1AddressValidationSearchPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.response_200_search_v1_address_validation_search_post.nil?
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


### Per-Operation Security Schemes

Some operations in this SDK require the security scheme to be specified at the request level. For example:
```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Components::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Components::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
)

res = s.address_validation.search(request: req, security: Models::Operations::SearchV1AddressValidationSearchPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.response_200_search_v1_address_validation_search_post.nil?
  # handle response
end

```
<!-- End Authentication [security] -->

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [address_validation](docs/sdks/addressvalidation/README.md)

* [search](docs/sdks/addressvalidation/README.md#search) - Search
* [suggestions](docs/sdks/addressvalidation/README.md#suggestions) - Suggestions

### [customers](docs/sdks/customers/README.md)

* [list](docs/sdks/customers/README.md#list) - Get Customers
* [create](docs/sdks/customers/README.md#create) - Create Customer
* [get](docs/sdks/customers/README.md#get) - Get Customer By Id
* [update](docs/sdks/customers/README.md#update) - Update Customer
* [get_by_external_id](docs/sdks/customers/README.md#get_by_external_id) - Get Customer By External Id
* [get_transactions](docs/sdks/customers/README.md#get_transactions) - Get Transactions By Customer Id
* [create_transaction](docs/sdks/customers/README.md#create_transaction) - Create Transaction By Customer Id

### [exemptions](docs/sdks/exemptions/README.md)

* [list](docs/sdks/exemptions/README.md#list) - Get Exemptions
* [create](docs/sdks/exemptions/README.md#create) - Create Exemption
* [get](docs/sdks/exemptions/README.md#get) - Get Exemption By Id
* [upload_certificate](docs/sdks/exemptions/README.md#upload_certificate) - Upload Exemption Certificate
* [get_attachments](docs/sdks/exemptions/README.md#get_attachments) - Get Attachments For Exemption

### [nexus](docs/sdks/nexus/README.md)

* [list](docs/sdks/nexus/README.md#list) - Get Nexus For Org

### [products](docs/sdks/products/README.md)

* [list](docs/sdks/products/README.md#list) - Get Products
* [create](docs/sdks/products/README.md#create) - Create Product
* [get](docs/sdks/products/README.md#get) - Get Product By Id
* [update](docs/sdks/products/README.md#update) - Update Product
* [list_categories](docs/sdks/products/README.md#list_categories) - Get Product Categories


### [tax_estimation](docs/sdks/taxestimation/README.md)

* [estimate_tax](docs/sdks/taxestimation/README.md#estimate_tax) - Estimate Tax

### [transactions](docs/sdks/transactions/README.md)

* [list](docs/sdks/transactions/README.md#list) - Get Transactions
* [create](docs/sdks/transactions/README.md#create) - Create Transaction
* [get_by_external_id](docs/sdks/transactions/README.md#get_by_external_id) - Get Transaction By External Id
* [update](docs/sdks/transactions/README.md#update) - Update Transaction
* [get_by_id](docs/sdks/transactions/README.md#get_by_id) - Get Transaction By Id
* [get_by_filing_id](docs/sdks/transactions/README.md#get_by_filing_id) - Get Transactions By Filing Id
* [create_credit_note](docs/sdks/transactions/README.md#create_credit_note) - Create Credit Note By Transaction Id
* [update_credit_note](docs/sdks/transactions/README.md#update_credit_note) - Update Credit Note By Transaction Id

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
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

begin
    req = Models::Components::AddressBase.new(
      phone: '555-123-4567',
      street_1: '1600 Amphitheatre Parkway',
      street_2: 'Building 40',
      city: 'Mountain View',
      county: 'Santa Clara',
      state: 'CA',
      postal_code: '94043',
      country: Models::Components::CountryCodeEnum::US,
      full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
    )

    res = s.address_validation.search(request: req, security: Models::Operations::SearchV1AddressValidationSearchPostSecurity.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
      ))

    unless res.response_200_search_v1_address_validation_search_post.nil?
      # handle response
    end
rescue Models::Errors::ErrorResponse => e
  # handle $e->$container data
  throw $e;
rescue Models::Errors::BackendSrcAddressValidationResponsesValidationErrorResponse => e
  # handle $e->$container data
  throw $e;
rescue Models::Errors::ErrorResponse => e
  # handle $e->$container data
  throw $e;
rescue Errors::APIError => e
  # handle default exception
  raise e
end

```
<!-- End Error Handling [errors] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

# Development

## Maturity

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning usage
to a specific package version. This way, you can install the same version each time without breaking changes unless you are intentionally
looking for the latest version.

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation. 
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release. 

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=openapi&utm_campaign=ruby)
