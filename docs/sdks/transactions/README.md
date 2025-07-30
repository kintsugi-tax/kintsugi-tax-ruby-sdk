# Transactions
(*transactions*)

## Overview

### Available Operations

* [list](#list) - Get Transactions
* [create](#create) - Create Transaction
* [get_by_external_id](#get_by_external_id) - Get Transaction By External Id
* [update](#update) - Update Transaction
* [get_by_id](#get_by_id) - Get Transaction By Id
* [get_by_filing_id](#get_by_filing_id) - Get Transactions By Filing Id
* [create_credit_note](#create_credit_note) - Create Credit Note By Transaction Id
* [update_credit_note](#update_credit_note) - Update Credit Note By Transaction Id

## list

The Get Transactions API retrieves a list of transactions with
    optional filtering, sorting, and pagination.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Operations::GetTransactionsV1TransactionsGetRequest.new(
  x_organization_id: 'org_12345',
)

res = s.transactions.list(request: req, security: Models::Operations::GetTransactionsV1TransactionsGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.page_transaction_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                           | Type                                                                                                                                | Required                                                                                                                            | Description                                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                           | [Models::Operations::GetTransactionsV1TransactionsGetRequest](../../models/operations/gettransactionsv1transactionsgetrequest.md)   | :heavy_check_mark:                                                                                                                  | The request object to use for the request.                                                                                          |
| `security`                                                                                                                          | [Models::Operations::GetTransactionsV1TransactionsGetSecurity](../../models/operations/gettransactionsv1transactionsgetsecurity.md) | :heavy_check_mark:                                                                                                                  | The security requirements to use for the request.                                                                                   |

### Response

**[T.nilable(Models::Operations::GetTransactionsV1TransactionsGetResponse)](../../models/operations/gettransactionsv1transactionsgetresponse.md)**

### Errors

| Error Type                                                             | Status Code                                                            | Content Type                                                           |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                          | 401, 404                                                               | application/json                                                       |
| Models::Errors::BackendSrcTransactionsResponsesValidationErrorResponse | 422                                                                    | application/json                                                       |
| Models::Errors::ErrorResponse                                          | 500                                                                    | application/json                                                       |
| Errors::APIError                                                       | 4XX, 5XX                                                               | \*/\*                                                                  |

## create

Create a transaction.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.transactions.create(security: Models::Operations::CreateTransactionV1TransactionsPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), x_organization_id: 'org_12345', transaction_public_request: Models::Components::TransactionPublicRequest.new(
  organization_id: 'orgn_YourOrgIdHere',
  external_id: 'YourUniqueOrder123',
  date: DateTime.iso8601('2024-01-15T14:30:00Z'),
  currency: Models::Components::CurrencyEnum::USD,
  source: Models::Components::SourceEnum::API,
  addresses: [
    Models::Components::TransactionAddressPublic.new(
      street_1: '123 Main St',
      city: 'San Francisco',
      state: 'CA',
      postal_code: '94107',
      country: Models::Components::CountryCodeEnum::US,
      type: Models::Components::AddressType::SHIP_TO,
    ),
  ],
  transaction_items: [
    Models::Components::TransactionItemBuilder.new(
      organization_id: 'orgn_YourOrgIdHere',
      date: DateTime.iso8601('2024-01-15T14:30:00Z'),
      external_product_id: 'SKU-ABC',
      product: 'Example Widget',
      quantity: 2.0,
      amount: 50.0,
    ),
  ],
  customer: Models::Components::TransactionImportCustomer.new(
    external_id: 'Cust456',
    name: 'John Doe',
    organization_id: 'orgn_YourOrgIdHere',
  ),
  type: Models::Components::TransactionTypeEnum::SALE,
))

unless res.transaction_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                 | Type                                                                                                                                      | Required                                                                                                                                  | Description                                                                                                                               | Example                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                | [Models::Operations::CreateTransactionV1TransactionsPostSecurity](../../models/operations/createtransactionv1transactionspostsecurity.md) | :heavy_check_mark:                                                                                                                        | The security requirements to use for the request.                                                                                         |                                                                                                                                           |
| `x_organization_id`                                                                                                                       | *T.nilable(::String)*                                                                                                                     | :heavy_check_mark:                                                                                                                        | The unique identifier for the organization making the request                                                                             | org_12345                                                                                                                                 |
| `transaction_public_request`                                                                                                              | [Models::Components::TransactionPublicRequest](../../models/shared/transactionpublicrequest.md)                                           | :heavy_check_mark:                                                                                                                        | N/A                                                                                                                                       |                                                                                                                                           |

### Response

**[T.nilable(Models::Operations::CreateTransactionV1TransactionsPostResponse)](../../models/operations/createtransactionv1transactionspostresponse.md)**

### Errors

| Error Type                                                             | Status Code                                                            | Content Type                                                           |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                          | 400, 401                                                               | application/json                                                       |
| Models::Errors::BackendSrcTransactionsResponsesValidationErrorResponse | 422                                                                    | application/json                                                       |
| Models::Errors::ErrorResponse                                          | 500                                                                    | application/json                                                       |
| Errors::APIError                                                       | 4XX, 5XX                                                               | \*/\*                                                                  |

## get_by_external_id

Retrieves a specific transaction based on its external ID.
    This allows users to fetch transaction details using an identifier from an external system.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.transactions.get_by_external_id(security: Models::Operations::GetTransactionByExternalIdV1TransactionsExternalExternalIdGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), external_id: '<id>', x_organization_id: 'org_12345')

unless res.transaction_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                     | Type                                                                                                                                                                                          | Required                                                                                                                                                                                      | Description                                                                                                                                                                                   | Example                                                                                                                                                                                       |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                    | [Models::Operations::GetTransactionByExternalIdV1TransactionsExternalExternalIdGetSecurity](../../models/operations/gettransactionbyexternalidv1transactionsexternalexternalidgetsecurity.md) | :heavy_check_mark:                                                                                                                                                                            | The security requirements to use for the request.                                                                                                                                             |                                                                                                                                                                                               |
| `external_id`                                                                                                                                                                                 | *::String*                                                                                                                                                                                    | :heavy_check_mark:                                                                                                                                                                            | The unique external identifier of the transaction.                                                                                                                                            |                                                                                                                                                                                               |
| `x_organization_id`                                                                                                                                                                           | *T.nilable(::String)*                                                                                                                                                                         | :heavy_check_mark:                                                                                                                                                                            | The unique identifier for the organization making the request                                                                                                                                 | org_12345                                                                                                                                                                                     |

### Response

**[T.nilable(Models::Operations::GetTransactionByExternalIdV1TransactionsExternalExternalIdGetResponse)](../../models/operations/gettransactionbyexternalidv1transactionsexternalexternalidgetresponse.md)**

### Errors

| Error Type                                                             | Status Code                                                            | Content Type                                                           |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                          | 401, 404                                                               | application/json                                                       |
| Models::Errors::BackendSrcTransactionsResponsesValidationErrorResponse | 422                                                                    | application/json                                                       |
| Models::Errors::ErrorResponse                                          | 500                                                                    | application/json                                                       |
| Errors::APIError                                                       | 4XX, 5XX                                                               | \*/\*                                                                  |

## update

Update a specific transaction by its ID.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.transactions.update(security: Models::Operations::UpdateTransactionV1TransactionsTransactionIdPutSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), transaction_id: '<id>', x_organization_id: 'org_12345', transaction_update: Models::Components::TransactionUpdate.new(
  organization_id: 'orgn_argaLQwMy2fJc',
  external_id: 'EXT12345',
  date: DateTime.iso8601('2025-04-02T17:36:59.814Z'),
  addresses: [
    Models::Components::TransactionAddressBuilder.new(
      type: Models::Components::AddressType::BILL_TO,
    ),
  ],
  transaction_items: [
    Models::Components::TransactionItemCreateUpdate.new(
      organization_id: 'orgn_argaLQwMy2fJc',
      date: DateTime.iso8601('2025-04-02T17:36:59.814Z'),
      external_product_id: '1186DUMMYITEM',
    ),
  ],
  customer: Models::Components::CustomerUpdate.new(),
))

unless res.transaction_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                         | Type                                                                                                                                                              | Required                                                                                                                                                          | Description                                                                                                                                                       | Example                                                                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                        | [Models::Operations::UpdateTransactionV1TransactionsTransactionIdPutSecurity](../../models/operations/updatetransactionv1transactionstransactionidputsecurity.md) | :heavy_check_mark:                                                                                                                                                | The security requirements to use for the request.                                                                                                                 |                                                                                                                                                                   |
| `transaction_id`                                                                                                                                                  | *::String*                                                                                                                                                        | :heavy_check_mark:                                                                                                                                                | N/A                                                                                                                                                               |                                                                                                                                                                   |
| `x_organization_id`                                                                                                                                               | *T.nilable(::String)*                                                                                                                                             | :heavy_check_mark:                                                                                                                                                | The unique identifier for the organization making the request                                                                                                     | org_12345                                                                                                                                                         |
| `transaction_update`                                                                                                                                              | [Models::Components::TransactionUpdate](../../models/shared/transactionupdate.md)                                                                                 | :heavy_check_mark:                                                                                                                                                | N/A                                                                                                                                                               |                                                                                                                                                                   |

### Response

**[T.nilable(Models::Operations::UpdateTransactionV1TransactionsTransactionIdPutResponse)](../../models/operations/updatetransactionv1transactionstransactionidputresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## get_by_id

The Get Transaction By Id API retrieves detailed information
    about a specific transaction by providing its unique transaction ID.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.transactions.get_by_id(security: Models::Operations::GetTransactionByIdV1TransactionsTransactionIdGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), transaction_id: '<id>', x_organization_id: 'org_12345')

unless res.transaction_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                           | Type                                                                                                                                                                | Required                                                                                                                                                            | Description                                                                                                                                                         | Example                                                                                                                                                             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                          | [Models::Operations::GetTransactionByIdV1TransactionsTransactionIdGetSecurity](../../models/operations/gettransactionbyidv1transactionstransactionidgetsecurity.md) | :heavy_check_mark:                                                                                                                                                  | The security requirements to use for the request.                                                                                                                   |                                                                                                                                                                     |
| `transaction_id`                                                                                                                                                    | *::String*                                                                                                                                                          | :heavy_check_mark:                                                                                                                                                  | The unique identifier of the transaction to retrieve.                                                                                                               |                                                                                                                                                                     |
| `x_organization_id`                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                               | :heavy_check_mark:                                                                                                                                                  | The unique identifier for the organization making the request                                                                                                       | org_12345                                                                                                                                                           |

### Response

**[T.nilable(Models::Operations::GetTransactionByIdV1TransactionsTransactionIdGetResponse)](../../models/operations/gettransactionbyidv1transactionstransactionidgetresponse.md)**

### Errors

| Error Type                                                             | Status Code                                                            | Content Type                                                           |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                          | 401, 404                                                               | application/json                                                       |
| Models::Errors::BackendSrcTransactionsResponsesValidationErrorResponse | 422                                                                    | application/json                                                       |
| Models::Errors::ErrorResponse                                          | 500                                                                    | application/json                                                       |
| Errors::APIError                                                       | 4XX, 5XX                                                               | \*/\*                                                                  |

## get_by_filing_id

Retrieve transactions by filing ID.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.transactions.get_by_filing_id(security: Models::Operations::GetTransactionsByFilingIdV1TransactionsFilingsFilingIdGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), filing_id: '<id>', x_organization_id: 'org_12345')

unless res.response_200_get_transactions_by_filing_id_v1_transactions_filings_filing_id_get.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                             | Type                                                                                                                                                                                  | Required                                                                                                                                                                              | Description                                                                                                                                                                           | Example                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                            | [Models::Operations::GetTransactionsByFilingIdV1TransactionsFilingsFilingIdGetSecurity](../../models/operations/gettransactionsbyfilingidv1transactionsfilingsfilingidgetsecurity.md) | :heavy_check_mark:                                                                                                                                                                    | The security requirements to use for the request.                                                                                                                                     |                                                                                                                                                                                       |
| `filing_id`                                                                                                                                                                           | *::String*                                                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                    | The unique identifier of the filing<br/>        whose transactions you wish to retrieve.<br/>                                                                                         |                                                                                                                                                                                       |
| `x_organization_id`                                                                                                                                                                   | *T.nilable(::String)*                                                                                                                                                                 | :heavy_check_mark:                                                                                                                                                                    | The unique identifier for the organization making the request                                                                                                                         | org_12345                                                                                                                                                                             |

### Response

**[T.nilable(Models::Operations::GetTransactionsByFilingIdV1TransactionsFilingsFilingIdGetResponse)](../../models/operations/gettransactionsbyfilingidv1transactionsfilingsfilingidgetresponse.md)**

### Errors

| Error Type                                                             | Status Code                                                            | Content Type                                                           |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                          | 401                                                                    | application/json                                                       |
| Models::Errors::BackendSrcTransactionsResponsesValidationErrorResponse | 422                                                                    | application/json                                                       |
| Models::Errors::ErrorResponse                                          | 500                                                                    | application/json                                                       |
| Errors::APIError                                                       | 4XX, 5XX                                                               | \*/\*                                                                  |

## create_credit_note

Create a new credit note for a specific transaction.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.transactions.create_credit_note(security: Models::Operations::CreateCreditNoteByTransactionIdV1TransactionsOriginalTransactionIdCreditNotesPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), original_transaction_id: '<id>', x_organization_id: 'org_12345', credit_note_create: Models::Components::CreditNoteCreate.new(
  external_id: 'CN-12345',
  date: DateTime.iso8601('2024-10-27T14:30:00Z'),
  status: Models::Components::Status::PENDING,
  description: 'Refund for damaged product',
  total_amount: 50.0,
  currency: Models::Components::CurrencyEnum::USD,
  transaction_items: [
    Models::Components::CreditNoteItemCreateUpdate.new(
      external_id: 'ITEM-1',
      date: DateTime.iso8601('2024-10-27T14:30:00Z'),
      external_product_id: 'PROD-ABC',
      quantity: 1.0,
      amount: 50.0,
    ),
  ],
))

unless res.transaction_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                             | Type                                                                                                                                                                                                                                  | Required                                                                                                                                                                                                                              | Description                                                                                                                                                                                                                           | Example                                                                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                                                            | [Models::Operations::CreateCreditNoteByTransactionIdV1TransactionsOriginalTransactionIdCreditNotesPostSecurity](../../models/operations/createcreditnotebytransactionidv1transactionsoriginaltransactionidcreditnotespostsecurity.md) | :heavy_check_mark:                                                                                                                                                                                                                    | The security requirements to use for the request.                                                                                                                                                                                     |                                                                                                                                                                                                                                       |
| `original_transaction_id`                                                                                                                                                                                                             | *::String*                                                                                                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                                                                    | N/A                                                                                                                                                                                                                                   |                                                                                                                                                                                                                                       |
| `x_organization_id`                                                                                                                                                                                                                   | *T.nilable(::String)*                                                                                                                                                                                                                 | :heavy_check_mark:                                                                                                                                                                                                                    | The unique identifier for the organization making the request                                                                                                                                                                         | org_12345                                                                                                                                                                                                                             |
| `credit_note_create`                                                                                                                                                                                                                  | [Models::Components::CreditNoteCreate](../../models/shared/creditnotecreate.md)                                                                                                                                                       | :heavy_check_mark:                                                                                                                                                                                                                    | N/A                                                                                                                                                                                                                                   |                                                                                                                                                                                                                                       |

### Response

**[T.nilable(Models::Operations::CreateCreditNoteByTransactionIdV1TransactionsOriginalTransactionIdCreditNotesPostResponse)](../../models/operations/createcreditnotebytransactionidv1transactionsoriginaltransactionidcreditnotespostresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## update_credit_note

Update an existing credit note for a specific transaction.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.transactions.update_credit_note(security: Models::Operations::UpdateCreditNoteByTransactionIdV1TransactionsOriginalTransactionIdCreditNotesCreditNoteIdPutSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), original_transaction_id: '<id>', credit_note_id: '<id>', x_organization_id: 'org_12345', credit_note_create: Models::Components::CreditNoteCreate.new(
  external_id: '<id>',
  date: DateTime.iso8601('2023-04-03T14:25:55.241Z'),
  status: Models::Components::Status::PENDING,
  currency: Models::Components::CurrencyEnum::JOD,
  transaction_items: [
    Models::Components::CreditNoteItemCreateUpdate.new(
      external_id: '<id>',
      date: DateTime.iso8601('2024-04-29T01:52:56.740Z'),
      external_product_id: '<id>',
    ),
  ],
))

unless res.any.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                                   | Type                                                                                                                                                                                                                                                        | Required                                                                                                                                                                                                                                                    | Description                                                                                                                                                                                                                                                 | Example                                                                                                                                                                                                                                                     |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                                                                                  | [Models::Operations::UpdateCreditNoteByTransactionIdV1TransactionsOriginalTransactionIdCreditNotesCreditNoteIdPutSecurity](../../models/operations/updatecreditnotebytransactionidv1transactionsoriginaltransactionidcreditnotescreditnoteidputsecurity.md) | :heavy_check_mark:                                                                                                                                                                                                                                          | The security requirements to use for the request.                                                                                                                                                                                                           |                                                                                                                                                                                                                                                             |
| `original_transaction_id`                                                                                                                                                                                                                                   | *::String*                                                                                                                                                                                                                                                  | :heavy_check_mark:                                                                                                                                                                                                                                          | N/A                                                                                                                                                                                                                                                         |                                                                                                                                                                                                                                                             |
| `credit_note_id`                                                                                                                                                                                                                                            | *::String*                                                                                                                                                                                                                                                  | :heavy_check_mark:                                                                                                                                                                                                                                          | N/A                                                                                                                                                                                                                                                         |                                                                                                                                                                                                                                                             |
| `x_organization_id`                                                                                                                                                                                                                                         | *T.nilable(::String)*                                                                                                                                                                                                                                       | :heavy_check_mark:                                                                                                                                                                                                                                          | The unique identifier for the organization making the request                                                                                                                                                                                               | org_12345                                                                                                                                                                                                                                                   |
| `credit_note_create`                                                                                                                                                                                                                                        | [Models::Components::CreditNoteCreate](../../models/shared/creditnotecreate.md)                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                                                          | N/A                                                                                                                                                                                                                                                         |                                                                                                                                                                                                                                                             |

### Response

**[T.nilable(Models::Operations::UpdateCreditNoteByTransactionIdV1TransactionsOriginalTransactionIdCreditNotesCreditNoteIdPutResponse)](../../models/operations/updatecreditnotebytransactionidv1transactionsoriginaltransactionidcreditnotescreditnoteidputresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |