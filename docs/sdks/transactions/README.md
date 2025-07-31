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

## list

The Get Transactions API retrieves a list of transactions with
    optional filtering, sorting, and pagination.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get_transactions_v1_transactions_get" method="get" path="/v1/transactions" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetTransactionsV1TransactionsGetRequest.new()

res = s.transactions.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                  | Type                                                                                                                       | Required                                                                                                                   | Description                                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                  | [Models::Ops::GetTransactionsV1TransactionsGetRequest](../../models/operations/gettransactionsv1transactionsgetrequest.md) | :heavy_check_mark:                                                                                                         | The request object to use for the request.                                                                                 |

### Response

**[T.nilable(Models::Shared::PageTransactionRead)](../../models/operations/pagetransactionread.md)**

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

<!-- UsageSnippet language="ruby" operationID="create_transaction_v1_transactions_post" method="post" path="/v1/transactions" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Shared::TransactionPublicRequest.new(
  organization_id: 'orgn_YourOrgIdHere',
  external_id: 'YourUniqueOrder123',
  date: DateTime.iso8601('2024-01-15T14:30:00Z'),
  currency: Models::Shared::CurrencyEnum::USD,
  source: Models::Shared::SourceEnum::API,
  addresses: [
    Models::Shared::TransactionAddressPublic.new(
      street_1: '123 Main St',
      city: 'San Francisco',
      state: 'CA',
      postal_code: '94107',
      country: Models::Shared::CountryCodeEnum::US,
      type: Models::Shared::AddressType::SHIP_TO,
    ),
  ],
  transaction_items: [
    Models::Shared::TransactionItemBuilder.new(
      organization_id: 'orgn_YourOrgIdHere',
      date: DateTime.iso8601('2024-01-15T14:30:00Z'),
      external_product_id: 'SKU-ABC',
      product: 'Example Widget',
      quantity: 2.0,
      amount: 50.0,
    ),
  ],
  customer: Models::Shared::CustomerBaseBase.new(
    name: 'John Doe',
    external_id: 'Cust456',
    organization_id: 'orgn_YourOrgIdHere',
  ),
  type: Models::Shared::TransactionTypeEnum::SALE,
)

res = s.transactions.create(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Shared::TransactionPublicRequest](../../models/shared/transactionpublicrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Shared::TransactionRead)](../../models/operations/transactionread.md)**

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

<!-- UsageSnippet language="ruby" operationID="getTransactionByExternalId" method="get" path="/v1/transactions/external/{external_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetTransactionByExternalIdRequest.new(
  external_id: '<id>',
)

res = s.transactions.get_by_external_id(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                      | Type                                                                                                           | Required                                                                                                       | Description                                                                                                    |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                      | [Models::Ops::GetTransactionByExternalIdRequest](../../models/operations/gettransactionbyexternalidrequest.md) | :heavy_check_mark:                                                                                             | The request object to use for the request.                                                                     |

### Response

**[T.nilable(Models::Shared::TransactionRead)](../../models/operations/transactionread.md)**

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

<!-- UsageSnippet language="ruby" operationID="update_transaction_v1_transactions__transaction_id__put" method="put" path="/v1/transactions/{transaction_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::UpdateTransactionV1TransactionsTransactionIdPutRequest.new(
  transaction_id: '<id>',
  transaction_update: Models::Shared::TransactionUpdate.new(
    organization_id: 'orgn_argaLQwMy2fJc',
    external_id: 'EXT12345',
    date: DateTime.iso8601('2025-04-02T17:36:59.814Z'),
    addresses: [
      Models::Shared::TransactionAddressBuilder.new(
        type: Models::Shared::AddressType::BILL_TO,
      ),
    ],
    transaction_items: [
      Models::Shared::TransactionItemCreateUpdate.new(
        organization_id: 'orgn_argaLQwMy2fJc',
        date: DateTime.iso8601('2025-04-02T17:36:59.814Z'),
        external_product_id: '1186DUMMYITEM',
      ),
    ],
    customer: Models::Shared::CustomerUpdate.new(),
  ),
)

res = s.transactions.update(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                | Type                                                                                                                                                     | Required                                                                                                                                                 | Description                                                                                                                                              |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                                                | [Models::Ops::UpdateTransactionV1TransactionsTransactionIdPutRequest](../../models/operations/updatetransactionv1transactionstransactionidputrequest.md) | :heavy_check_mark:                                                                                                                                       | The request object to use for the request.                                                                                                               |

### Response

**[T.nilable(Models::Shared::TransactionRead)](../../models/operations/transactionread.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## get_by_id

The Get Transaction By Id API retrieves detailed information
    about a specific transaction by providing its unique transaction ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get_transaction_by_id_v1_transactions__transaction_id__get" method="get" path="/v1/transactions/{transaction_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetTransactionByIdV1TransactionsTransactionIdGetRequest.new(
  transaction_id: '<id>',
)

res = s.transactions.get_by_id(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                  | Type                                                                                                                                                       | Required                                                                                                                                                   | Description                                                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                                                  | [Models::Ops::GetTransactionByIdV1TransactionsTransactionIdGetRequest](../../models/operations/gettransactionbyidv1transactionstransactionidgetrequest.md) | :heavy_check_mark:                                                                                                                                         | The request object to use for the request.                                                                                                                 |

### Response

**[T.nilable(Models::Shared::TransactionRead)](../../models/operations/transactionread.md)**

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

<!-- UsageSnippet language="ruby" operationID="getTransactionsByFiling" method="get" path="/v1/transactions/filings/{filing_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetTransactionsByFilingRequest.new(
  filing_id: '<id>',
)

res = s.transactions.get_by_filing_id(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                | Type                                                                                                     | Required                                                                                                 | Description                                                                                              |
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                | [Models::Ops::GetTransactionsByFilingRequest](../../models/operations/gettransactionsbyfilingrequest.md) | :heavy_check_mark:                                                                                       | The request object to use for the request.                                                               |

### Response

**[T.nilable(T::Array[Models::Shared::TransactionRead])](../../models/operations/.md)**

### Errors

| Error Type                                                             | Status Code                                                            | Content Type                                                           |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                          | 401                                                                    | application/json                                                       |
| Models::Errors::BackendSrcTransactionsResponsesValidationErrorResponse | 422                                                                    | application/json                                                       |
| Models::Errors::ErrorResponse                                          | 500                                                                    | application/json                                                       |
| Errors::APIError                                                       | 4XX, 5XX                                                               | \*/\*                                                                  |