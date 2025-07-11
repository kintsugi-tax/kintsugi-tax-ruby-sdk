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

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Operations::GetExemptionsV1ExemptionsGetRequest.new(
  country_code: [
    'U',
    'S',
  ],
  jurisdiction: 'CA',
  start_date: Date.parse('2024-01-01'),
  end_date: Date.parse('2024-01-01'),
  customer_id: 'cust_1234',
  transaction_id: 'trans_1234',
  x_organization_id: 'org_12345',
)

res = s.exemptions.list(request: req, security: Models::Operations::GetExemptionsV1ExemptionsGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.fastapi_pagination_default_page_exemption_read_2.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                   | Type                                                                                                                        | Required                                                                                                                    | Description                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                   | [Models::Operations::GetExemptionsV1ExemptionsGetRequest](../../models/operations/getexemptionsv1exemptionsgetrequest.md)   | :heavy_check_mark:                                                                                                          | The request object to use for the request.                                                                                  |
| `security`                                                                                                                  | [Models::Operations::GetExemptionsV1ExemptionsGetSecurity](../../models/operations/getexemptionsv1exemptionsgetsecurity.md) | :heavy_check_mark:                                                                                                          | The security requirements to use for the request.                                                                           |

### Response

**[T.nilable(Models::Operations::GetExemptionsV1ExemptionsGetResponse)](../../models/operations/getexemptionsv1exemptionsgetresponse.md)**

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

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.exemptions.create(security: Models::Operations::CreateExemptionV1ExemptionsPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), x_organization_id: 'org_12345', exemption_create: Models::Components::ExemptionCreate.new(
  exemption_type: Models::Components::ExemptionType::WHOLESALE,
  jurisdiction: 'CA',
  country_code: Models::Components::CountryCodeEnum::US,
  start_date: Date.parse('2024-01-01'),
  end_date: Date.parse('2026-01-01'),
  customer_id: 'cust_001',
  transaction_id: 'txn_123',
  reseller: true,
  fein: '12-3456789',
  sales_tax_id: 'ST-98765',
  status: Models::Components::ExemptionStatus::ACTIVE,
))

unless res.backend_src_exemptions_serializers_exemption_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                         | Type                                                                                                                              | Required                                                                                                                          | Description                                                                                                                       | Example                                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                        | [Models::Operations::CreateExemptionV1ExemptionsPostSecurity](../../models/operations/createexemptionv1exemptionspostsecurity.md) | :heavy_check_mark:                                                                                                                | The security requirements to use for the request.                                                                                 |                                                                                                                                   |
| `x_organization_id`                                                                                                               | *T.nilable(::String)*                                                                                                             | :heavy_check_mark:                                                                                                                | The unique identifier for the organization making the request                                                                     | org_12345                                                                                                                         |
| `exemption_create`                                                                                                                | [Models::Components::ExemptionCreate](../../models/shared/exemptioncreate.md)                                                     | :heavy_check_mark:                                                                                                                | N/A                                                                                                                               |                                                                                                                                   |

### Response

**[T.nilable(Models::Operations::CreateExemptionV1ExemptionsPostResponse)](../../models/operations/createexemptionv1exemptionspostresponse.md)**

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

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.exemptions.get(security: Models::Operations::GetExemptionByIdV1ExemptionsExemptionIdGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), exemption_id: '<id>', x_organization_id: 'org_12345')

unless res.backend_src_exemptions_models_exemption_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                               | Type                                                                                                                                                    | Required                                                                                                                                                | Description                                                                                                                                             | Example                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                              | [Models::Operations::GetExemptionByIdV1ExemptionsExemptionIdGetSecurity](../../models/operations/getexemptionbyidv1exemptionsexemptionidgetsecurity.md) | :heavy_check_mark:                                                                                                                                      | The security requirements to use for the request.                                                                                                       |                                                                                                                                                         |
| `exemption_id`                                                                                                                                          | *::String*                                                                                                                                              | :heavy_check_mark:                                                                                                                                      | The unique identifier for the exemption being retrieved.                                                                                                |                                                                                                                                                         |
| `x_organization_id`                                                                                                                                     | *T.nilable(::String)*                                                                                                                                   | :heavy_check_mark:                                                                                                                                      | The unique identifier for the organization making the request                                                                                           | org_12345                                                                                                                                               |

### Response

**[T.nilable(Models::Operations::GetExemptionByIdV1ExemptionsExemptionIdGetResponse)](../../models/operations/getexemptionbyidv1exemptionsexemptionidgetresponse.md)**

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

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.exemptions.upload_certificate(security: Models::Operations::UploadExemptionCertificateV1ExemptionsExemptionIdAttachmentsPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), exemption_id: '<id>', x_organization_id: 'org_12345', body_upload_exemption_certificate_v1_exemptions_exemption_id_attachments_post: Models::Components::BodyUploadExemptionCertificateV1ExemptionsExemptionIdAttachmentsPost.new(
  file: Models::Components::File.new(
    file_name: 'example.file',
    content: File.binread("example.file"),
  ),
))

unless res.attachment_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                           | Type                                                                                                                                                                                                | Required                                                                                                                                                                                            | Description                                                                                                                                                                                         | Example                                                                                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                          | [Models::Operations::UploadExemptionCertificateV1ExemptionsExemptionIdAttachmentsPostSecurity](../../models/operations/uploadexemptioncertificatev1exemptionsexemptionidattachmentspostsecurity.md) | :heavy_check_mark:                                                                                                                                                                                  | The security requirements to use for the request.                                                                                                                                                   |                                                                                                                                                                                                     |
| `exemption_id`                                                                                                                                                                                      | *::String*                                                                                                                                                                                          | :heavy_check_mark:                                                                                                                                                                                  | The unique identifier for the exemption to which the attachment will be associated.                                                                                                                 |                                                                                                                                                                                                     |
| `x_organization_id`                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                               | :heavy_check_mark:                                                                                                                                                                                  | The unique identifier for the organization making the request                                                                                                                                       | org_12345                                                                                                                                                                                           |
| `body_upload_exemption_certificate_v1_exemptions_exemption_id_attachments_post`                                                                                                                     | [Models::Components::BodyUploadExemptionCertificateV1ExemptionsExemptionIdAttachmentsPost](../../models/shared/bodyuploadexemptioncertificatev1exemptionsexemptionidattachmentspost.md)             | :heavy_check_mark:                                                                                                                                                                                  | N/A                                                                                                                                                                                                 |                                                                                                                                                                                                     |

### Response

**[T.nilable(Models::Operations::UploadExemptionCertificateV1ExemptionsExemptionIdAttachmentsPostResponse)](../../models/operations/uploadexemptioncertificatev1exemptionsexemptionidattachmentspostresponse.md)**

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

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.exemptions.get_attachments(security: Models::Operations::GetAttachmentsForExemptionV1ExemptionsExemptionIdAttachmentsGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), exemption_id: '<id>', x_organization_id: 'org_12345')

unless res.response_200_get_attachments_for_exemption_v1_exemptions_exemption_id_attachments_get.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                         | Type                                                                                                                                                                                              | Required                                                                                                                                                                                          | Description                                                                                                                                                                                       | Example                                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                        | [Models::Operations::GetAttachmentsForExemptionV1ExemptionsExemptionIdAttachmentsGetSecurity](../../models/operations/getattachmentsforexemptionv1exemptionsexemptionidattachmentsgetsecurity.md) | :heavy_check_mark:                                                                                                                                                                                | The security requirements to use for the request.                                                                                                                                                 |                                                                                                                                                                                                   |
| `exemption_id`                                                                                                                                                                                    | *::String*                                                                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                                | The unique identifier for the exemption<br/>        whose attachments are being retrieved.                                                                                                        |                                                                                                                                                                                                   |
| `x_organization_id`                                                                                                                                                                               | *T.nilable(::String)*                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                | The unique identifier for the organization making the request                                                                                                                                     | org_12345                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::GetAttachmentsForExemptionV1ExemptionsExemptionIdAttachmentsGetResponse)](../../models/operations/getattachmentsforexemptionv1exemptionsexemptionidattachmentsgetresponse.md)**

### Errors

| Error Type                                                           | Status Code                                                          | Content Type                                                         |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                        | 401                                                                  | application/json                                                     |
| Models::Errors::BackendSrcExemptionsResponsesValidationErrorResponse | 422                                                                  | application/json                                                     |
| Errors::APIError                                                     | 4XX, 5XX                                                             | \*/\*                                                                |