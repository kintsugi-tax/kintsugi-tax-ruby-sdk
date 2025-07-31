# Exemptions
(*exemptions*)

## Overview

### Available Operations

* [list](#list) - Get Exemptions
* [create](#create) - Create Exemption
* [get](#get) - Get Exemption By Id
* [upload_certificate](#upload_certificate) - Upload Exemption Certificate
* [get_attachments](#get_attachments) - Get Attachments For Exemption

## list

Retrieve a list of exemptions based on filters.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get_exemptions_v1_exemptions_get" method="get" path="/v1/exemptions" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetExemptionsV1ExemptionsGetRequest.new(
  search_query: 'John',
  country_code: [

  ],
  jurisdiction: 'CA',
  start_date: '2024-01-01',
  end_date: '2024-01-01',
  customer_id: 'cust_1234',
  transaction_id: 'trans_1234',
)

res = s.exemptions.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                          | Type                                                                                                               | Required                                                                                                           | Description                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| `request`                                                                                                          | [Models::Ops::GetExemptionsV1ExemptionsGetRequest](../../models/operations/getexemptionsv1exemptionsgetrequest.md) | :heavy_check_mark:                                                                                                 | The request object to use for the request.                                                                         |

### Response

**[T.nilable(Models::Shared::FastapiPaginationDefaultPageExemptionRead2)](../../models/operations/fastapipaginationdefaultpageexemptionread2.md)**

### Errors

| Error Type                                                           | Status Code                                                          | Content Type                                                         |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                        | 401                                                                  | application/json                                                     |
| Models::Errors::BackendSrcExemptionsResponsesValidationErrorResponse | 422                                                                  | application/json                                                     |
| Models::Errors::ErrorResponse                                        | 500                                                                  | application/json                                                     |
| Errors::APIError                                                     | 4XX, 5XX                                                             | \*/\*                                                                |

## create

The Create Exemption API allows you to create a new exemption record.
    This includes defining details such as exemption type, jurisdiction,
    Country, State, validity dates, etc.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="create_exemption_v1_exemptions_post" method="post" path="/v1/exemptions" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Shared::ExemptionCreate.new(
  exemption_type: Models::Shared::ExemptionType::WHOLESALE,
  jurisdiction: 'CA',
  country_code: Models::Shared::CountryCodeEnum::US,
  start_date: Date.parse('2024-01-01'),
  end_date: '2026-01-01',
  customer_id: 'cust_001',
  transaction_id: 'txn_123',
  reseller: true,
  fein: '12-3456789',
  sales_tax_id: 'ST-98765',
  status: Models::Shared::ExemptionStatus::ACTIVE,
)

res = s.exemptions.create(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                 | Type                                                                      | Required                                                                  | Description                                                               |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `request`                                                                 | [Models::Shared::ExemptionCreate](../../models/shared/exemptioncreate.md) | :heavy_check_mark:                                                        | The request object to use for the request.                                |

### Response

**[T.nilable(Models::Shared::BackendSrcExemptionsSerializersExemptionRead)](../../models/operations/backendsrcexemptionsserializersexemptionread.md)**

### Errors

| Error Type                                                           | Status Code                                                          | Content Type                                                         |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                        | 401                                                                  | application/json                                                     |
| Models::Errors::BackendSrcExemptionsResponsesValidationErrorResponse | 422                                                                  | application/json                                                     |
| Models::Errors::ErrorResponse                                        | 500                                                                  | application/json                                                     |
| Errors::APIError                                                     | 4XX, 5XX                                                             | \*/\*                                                                |

## get

The Get Exemption By ID API retrieves a specific exemption record by
    its unique ID. This API is useful for retrieving detailed information
    about a particular exemption, including its associated
    customer, organisation id, status, etc.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get_exemption_by_id_v1_exemptions__exemption_id__get" method="get" path="/v1/exemptions/{exemption_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetExemptionByIdV1ExemptionsExemptionIdGetRequest.new(
  exemption_id: '<id>',
)

res = s.exemptions.get(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                      | Type                                                                                                                                           | Required                                                                                                                                       | Description                                                                                                                                    |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                                      | [Models::Ops::GetExemptionByIdV1ExemptionsExemptionIdGetRequest](../../models/operations/getexemptionbyidv1exemptionsexemptionidgetrequest.md) | :heavy_check_mark:                                                                                                                             | The request object to use for the request.                                                                                                     |

### Response

**[T.nilable(Models::Shared::BackendSrcExemptionsModelsExemptionRead)](../../models/operations/backendsrcexemptionsmodelsexemptionread.md)**

### Errors

| Error Type                                                           | Status Code                                                          | Content Type                                                         |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                        | 404                                                                  | application/json                                                     |
| Models::Errors::BackendSrcExemptionsResponsesValidationErrorResponse | 422                                                                  | application/json                                                     |
| Models::Errors::ErrorResponse                                        | 500                                                                  | application/json                                                     |
| Errors::APIError                                                     | 4XX, 5XX                                                             | \*/\*                                                                |

## upload_certificate

The Upload Exemption Certificate API allows you
    to upload a file attachment (e.g., exemption certificate) for a specific exemption.
    This is primarily used to associate supporting documents with an exemption record
    to ensure compliance and facilitate verification.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="uploadExemptionCert" method="post" path="/v1/exemptions/{exemption_id}/attachments" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::UploadExemptionCertRequest.new(
  exemption_id: '<id>',
  body_upload_exemption_certificate_v1_exemptions_exemption_id_attachments_post: Models::Shared::BodyUploadExemptionCertificateV1ExemptionsExemptionIdAttachmentsPost.new(
    file: Models::Shared::File.new(
      file_name: 'example.file',
      content: File.binread("example.file"),
    ),
  ),
)

res = s.exemptions.upload_certificate(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                        | Type                                                                                             | Required                                                                                         | Description                                                                                      |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ |
| `request`                                                                                        | [Models::Ops::UploadExemptionCertRequest](../../models/operations/uploadexemptioncertrequest.md) | :heavy_check_mark:                                                                               | The request object to use for the request.                                                       |

### Response

**[T.nilable(Models::Shared::AttachmentRead)](../../models/operations/attachmentread.md)**

### Errors

| Error Type                                                           | Status Code                                                          | Content Type                                                         |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                        | 401                                                                  | application/json                                                     |
| Models::Errors::BackendSrcExemptionsResponsesValidationErrorResponse | 422                                                                  | application/json                                                     |
| Models::Errors::ErrorResponse                                        | 500                                                                  | application/json                                                     |
| Errors::APIError                                                     | 4XX, 5XX                                                             | \*/\*                                                                |

## get_attachments

The Get Attachments for Exemption API retrieves all
    attachments associated with a specific exemption.
    This is used to view and manage supporting documents
    like exemption certificates uploaded for a particular exemption record.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getExemptionAttachments" method="get" path="/v1/exemptions/{exemption_id}/attachments" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetExemptionAttachmentsRequest.new(
  exemption_id: '<id>',
)

res = s.exemptions.get_attachments(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                | Type                                                                                                     | Required                                                                                                 | Description                                                                                              |
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                | [Models::Ops::GetExemptionAttachmentsRequest](../../models/operations/getexemptionattachmentsrequest.md) | :heavy_check_mark:                                                                                       | The request object to use for the request.                                                               |

### Response

**[T.nilable(T::Array[Models::Shared::AttachmentRead])](../../models/operations/.md)**

### Errors

| Error Type                                                           | Status Code                                                          | Content Type                                                         |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                        | 401                                                                  | application/json                                                     |
| Models::Errors::BackendSrcExemptionsResponsesValidationErrorResponse | 422                                                                  | application/json                                                     |
| Errors::APIError                                                     | 4XX, 5XX                                                             | \*/\*                                                                |