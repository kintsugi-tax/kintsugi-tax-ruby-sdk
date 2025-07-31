# AddressValidation
(*address_validation*)

## Overview

### Available Operations

* [search](#search) - Search
* [suggestions](#suggestions) - Suggestions

## search

This API validates and enriches address information
    submitted by the user. It ensures that the address is standardized, accurate,
    and compliant with geographical and postal standards.
    The API also adds additional fields, such as county, when possible.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="search_v1_address_validation_search_post" method="post" path="/v1/address_validation/search" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new

req = Models::Shared::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Shared::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
)

res = s.address_validation.search(request: req, security: Models::Ops::SearchV1AddressValidationSearchPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                   | Type                                                                                                                        | Required                                                                                                                    | Description                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                   | [Models::Shared::AddressBase](../../models/shared/addressbase.md)                                                           | :heavy_check_mark:                                                                                                          | The request object to use for the request.                                                                                  |
| `security`                                                                                                                  | [Models::Ops::SearchV1AddressValidationSearchPostSecurity](../../models/ops/searchv1addressvalidationsearchpostsecurity.md) | :heavy_check_mark:                                                                                                          | The security requirements to use for the request.                                                                           |

### Response

**[T.nilable(T::Array[Models::Shared::AddressSearchResponse])](../../models/operations/.md)**

### Errors

| Error Type                                                                  | Status Code                                                                 | Content Type                                                                |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                               | 401                                                                         | application/json                                                            |
| Models::Errors::BackendSrcAddressValidationResponsesValidationErrorResponse | 422                                                                         | application/json                                                            |
| Models::Errors::ErrorResponse                                               | 500                                                                         | application/json                                                            |
| Errors::APIError                                                            | 4XX, 5XX                                                                    | \*/\*                                                                       |

## suggestions

This API endpoint provides address suggestions based on
    partial input data. It helps users auto-complete and validate addresses efficiently
    by returning a list of suggested addresses that match the input criteria.
    This improves accuracy, increases speed, reduces errors,
    and streamlines the data entry process.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="suggestions_v1_address_validation_suggestions_post" method="post" path="/v1/address_validation/suggestions" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Shared::ValidationAddress.new(
  line1: '1600 Amphitheatre Parkway',
  line2: '',
  line3: '',
  city: 'Mountain View',
  state: 'CA',
  postal_code: '94043',
  id: 215,
  county: '',
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
)

res = s.address_validation.suggestions(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                     | Type                                                                          | Required                                                                      | Description                                                                   |
| ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `request`                                                                     | [Models::Shared::ValidationAddress](../../models/shared/validationaddress.md) | :heavy_check_mark:                                                            | The request object to use for the request.                                    |

### Response

**[T.nilable(::Object)](../../models/operations/.md)**

### Errors

| Error Type                                                                  | Status Code                                                                 | Content Type                                                                |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                               | 401                                                                         | application/json                                                            |
| Models::Errors::BackendSrcAddressValidationResponsesValidationErrorResponse | 422                                                                         | application/json                                                            |
| Models::Errors::ErrorResponse                                               | 500                                                                         | application/json                                                            |
| Errors::APIError                                                            | 4XX, 5XX                                                                    | \*/\*                                                                       |