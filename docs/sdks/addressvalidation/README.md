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

### Parameters

| Parameter                                                                                                                                 | Type                                                                                                                                      | Required                                                                                                                                  | Description                                                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                                 | [Models::Components::AddressBase](../../models/shared/addressbase.md)                                                                     | :heavy_check_mark:                                                                                                                        | The request object to use for the request.                                                                                                |
| `security`                                                                                                                                | [Models::Operations::SearchV1AddressValidationSearchPostSecurity](../../models/operations/searchv1addressvalidationsearchpostsecurity.md) | :heavy_check_mark:                                                                                                                        | The security requirements to use for the request.                                                                                         |

### Response

**[T.nilable(Models::Operations::SearchV1AddressValidationSearchPostResponse)](../../models/operations/searchv1addressvalidationsearchpostresponse.md)**

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

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.address_validation.suggestions(security: Models::Operations::SuggestionsV1AddressValidationSuggestionsPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), x_organization_id: 'org_12345', validation_address: Models::Components::ValidationAddress.new(
  line1: '1600 Amphitheatre Parkway',
  line2: '',
  line3: '',
  city: 'Mountain View',
  state: 'CA',
  country: 'US',
  postal_code: '94043',
  id: 215,
  county: '',
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
))

unless res.any.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                     | Type                                                                                                                                                          | Required                                                                                                                                                      | Description                                                                                                                                                   | Example                                                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                    | [Models::Operations::SuggestionsV1AddressValidationSuggestionsPostSecurity](../../models/operations/suggestionsv1addressvalidationsuggestionspostsecurity.md) | :heavy_check_mark:                                                                                                                                            | The security requirements to use for the request.                                                                                                             |                                                                                                                                                               |
| `x_organization_id`                                                                                                                                           | *T.nilable(::String)*                                                                                                                                         | :heavy_check_mark:                                                                                                                                            | The unique identifier for the organization making the request                                                                                                 | org_12345                                                                                                                                                     |
| `validation_address`                                                                                                                                          | [Models::Components::ValidationAddress](../../models/shared/validationaddress.md)                                                                             | :heavy_check_mark:                                                                                                                                            | N/A                                                                                                                                                           |                                                                                                                                                               |

### Response

**[T.nilable(Models::Operations::SuggestionsV1AddressValidationSuggestionsPostResponse)](../../models/operations/suggestionsv1addressvalidationsuggestionspostresponse.md)**

### Errors

| Error Type                                                                  | Status Code                                                                 | Content Type                                                                |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                               | 401                                                                         | application/json                                                            |
| Models::Errors::BackendSrcAddressValidationResponsesValidationErrorResponse | 422                                                                         | application/json                                                            |
| Models::Errors::ErrorResponse                                               | 500                                                                         | application/json                                                            |
| Errors::APIError                                                            | 4XX, 5XX                                                                    | \*/\*                                                                       |