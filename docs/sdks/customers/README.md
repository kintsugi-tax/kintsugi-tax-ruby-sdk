# Customers
(*customers*)

## Overview

### Available Operations

* [list](#list) - Get Customers
* [create](#create) - Create Customer
* [get](#get) - Get Customer By Id
* [update](#update) - Update Customer
* [get_by_external_id](#get_by_external_id) - Get Customer By External Id
* [get_transactions](#get_transactions) - Get Transactions By Customer Id
* [create_transaction](#create_transaction) - Create Transaction By Customer Id

## list

The Get Customers API retrieves
    a paginated list of customers based on specified filters.
    This API allows searching, filtering by country and state, and sorting the results.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Operations::GetCustomersV1Request.new(
  search_query: 'John',
  country: [
    'U',
    'S',
  ],
  state: 'CA',
  source_in: 'SHOPIFY,API',
  order_by: 'created_at,street_1,street_2,city,state,postal_code,country,status',
  x_organization_id: 'org_12345',
)

res = s.customers.list(request: req, security: Models::Operations::GetCustomersV1Security.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.page_customer_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                       | Type                                                                                            | Required                                                                                        | Description                                                                                     |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `request`                                                                                       | [Models::Operations::GetCustomersV1Request](../../models/operations/getcustomersv1request.md)   | :heavy_check_mark:                                                                              | The request object to use for the request.                                                      |
| `security`                                                                                      | [Models::Operations::GetCustomersV1Security](../../models/operations/getcustomersv1security.md) | :heavy_check_mark:                                                                              | The security requirements to use for the request.                                               |

### Response

**[T.nilable(Models::Operations::GetCustomersV1Response)](../../models/operations/getcustomersv1response.md)**

### Errors

| Error Type                                                          | Status Code                                                         | Content Type                                                        |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                       | 401, 404                                                            | application/json                                                    |
| Models::Errors::BackendSrcCustomersResponsesValidationErrorResponse | 422                                                                 | application/json                                                    |
| Models::Errors::ErrorResponse                                       | 500                                                                 | application/json                                                    |
| Errors::APIError                                                    | 4XX, 5XX                                                            | \*/\*                                                               |

## create

The Create Customer API enables the creation of a new customer record with essential
details like name, contact information, and address, along with optional metadata.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.customers.create(security: Models::Operations::CreateCustomerV1CustomersPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), x_organization_id: 'org_12345', customer_create: Models::Components::CustomerCreate.new(
  phone: '987-654-3210',
  street_1: '456 Elm St',
  street_2: 'Suite 202',
  city: 'Metropolis',
  county: 'Wayne',
  state: 'NY',
  postal_code: '10001',
  country: Models::Components::CountryCodeEnum::US,
  name: 'Jane Smith',
  external_id: 'cust_002',
  status: Models::Components::StatusEnum::ARCHIVED,
  email: 'jane.smith@example.com',
  source: Models::Components::SourceEnum::SHOPIFY,
  address_status: Models::Components::AddressStatus::PARTIALLY_VERIFIED,
))

unless res.customer_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                     | Type                                                                                                                          | Required                                                                                                                      | Description                                                                                                                   | Example                                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                    | [Models::Operations::CreateCustomerV1CustomersPostSecurity](../../models/operations/createcustomerv1customerspostsecurity.md) | :heavy_check_mark:                                                                                                            | The security requirements to use for the request.                                                                             |                                                                                                                               |
| `x_organization_id`                                                                                                           | *T.nilable(::String)*                                                                                                         | :heavy_check_mark:                                                                                                            | The unique identifier for the organization making the request                                                                 | org_12345                                                                                                                     |
| `customer_create`                                                                                                             | [Models::Components::CustomerCreate](../../models/shared/customercreate.md)                                                   | :heavy_check_mark:                                                                                                            | N/A                                                                                                                           |                                                                                                                               |

### Response

**[T.nilable(Models::Operations::CreateCustomerV1CustomersPostResponse)](../../models/operations/createcustomerv1customerspostresponse.md)**

### Errors

| Error Type                                                          | Status Code                                                         | Content Type                                                        |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                       | 401, 404                                                            | application/json                                                    |
| Models::Errors::BackendSrcCustomersResponsesValidationErrorResponse | 422                                                                 | application/json                                                    |
| Models::Errors::ErrorResponse                                       | 500                                                                 | application/json                                                    |
| Errors::APIError                                                    | 4XX, 5XX                                                            | \*/\*                                                               |

## get

The Get Customer By ID API retrieves the details of a single customer
    using their unique identifier. It returns customer-specific data,
    including contact information, address, name and metadata, etc.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.customers.get(security: Models::Operations::GetCustomerByIdV1CustomersCustomerIdGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), customer_id: 'cust_abc123', x_organization_id: 'org_12345')

unless res.customer_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                         | Type                                                                                                                                              | Required                                                                                                                                          | Description                                                                                                                                       | Example                                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                        | [Models::Operations::GetCustomerByIdV1CustomersCustomerIdGetSecurity](../../models/operations/getcustomerbyidv1customerscustomeridgetsecurity.md) | :heavy_check_mark:                                                                                                                                | The security requirements to use for the request.                                                                                                 |                                                                                                                                                   |
| `customer_id`                                                                                                                                     | *::String*                                                                                                                                        | :heavy_check_mark:                                                                                                                                | Unique identifier of the customer                                                                                                                 | cust_abc123                                                                                                                                       |
| `x_organization_id`                                                                                                                               | *T.nilable(::String)*                                                                                                                             | :heavy_check_mark:                                                                                                                                | The unique identifier for the organization making the request                                                                                     | org_12345                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::GetCustomerByIdV1CustomersCustomerIdGetResponse)](../../models/operations/getcustomerbyidv1customerscustomeridgetresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## update

The Update Customer API allows you to modify an existing customer's
    information using their unique identifier,
    enabling updates to their details as needed.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.customers.update(security: Models::Operations::UpdateCustomerV1CustomersCustomerIdPutSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), customer_id: '<id>', x_organization_id: 'org_12345', customer_update: Models::Components::CustomerUpdate.new(
  phone: '987-654-3210',
  street_1: '456 Elm St',
  street_2: 'Suite 202',
  city: 'Metropolis',
  county: 'Wayne',
  state: 'NY',
  postal_code: '10001',
  country: Models::Components::CountryCodeEnum::US,
  full_address: '456 Elm St, Suite 202, Metropolis, NY 10001, US',
  name: 'Jane Smith',
  status: Models::Components::StatusEnum::ACTIVE,
  email: 'john.doe@example.com',
  source: Models::Components::SourceEnum::SHOPIFY,
  address_status: Models::Components::AddressStatus::VERIFIED,
  external_id: 'cust_002',
))

unless res.customer_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                       | Type                                                                                                                                            | Required                                                                                                                                        | Description                                                                                                                                     | Example                                                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                      | [Models::Operations::UpdateCustomerV1CustomersCustomerIdPutSecurity](../../models/operations/updatecustomerv1customerscustomeridputsecurity.md) | :heavy_check_mark:                                                                                                                              | The security requirements to use for the request.                                                                                               |                                                                                                                                                 |
| `customer_id`                                                                                                                                   | *::String*                                                                                                                                      | :heavy_check_mark:                                                                                                                              | Unique identifier of the customer to be retrieved.                                                                                              |                                                                                                                                                 |
| `x_organization_id`                                                                                                                             | *T.nilable(::String)*                                                                                                                           | :heavy_check_mark:                                                                                                                              | The unique identifier for the organization making the request                                                                                   | org_12345                                                                                                                                       |
| `customer_update`                                                                                                                               | [Models::Components::CustomerUpdate](../../models/shared/customerupdate.md)                                                                     | :heavy_check_mark:                                                                                                                              | N/A                                                                                                                                             |                                                                                                                                                 |

### Response

**[T.nilable(Models::Operations::UpdateCustomerV1CustomersCustomerIdPutResponse)](../../models/operations/updatecustomerv1customerscustomeridputresponse.md)**

### Errors

| Error Type                                                          | Status Code                                                         | Content Type                                                        |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                       | 401, 404                                                            | application/json                                                    |
| Models::Errors::BackendSrcCustomersResponsesValidationErrorResponse | 422                                                                 | application/json                                                    |
| Models::Errors::ErrorResponse                                       | 500                                                                 | application/json                                                    |
| Errors::APIError                                                    | 4XX, 5XX                                                            | \*/\*                                                               |

## get_by_external_id

The Get Customer By External ID API retrieves the details of a single customer using
their external identifier. This endpoint is useful for accessing customer data when only
an external ID is available.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.customers.get_by_external_id(security: Models::Operations::GetCustomerByExternalIdV1CustomersExternalExternalIdGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), external_id: 'external_12345', x_organization_id: 'org_12345')

unless res.customer_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                         | Type                                                                                                                                                                              | Required                                                                                                                                                                          | Description                                                                                                                                                                       | Example                                                                                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                        | [Models::Operations::GetCustomerByExternalIdV1CustomersExternalExternalIdGetSecurity](../../models/operations/getcustomerbyexternalidv1customersexternalexternalidgetsecurity.md) | :heavy_check_mark:                                                                                                                                                                | The security requirements to use for the request.                                                                                                                                 |                                                                                                                                                                                   |
| `external_id`                                                                                                                                                                     | *::String*                                                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                | The external identifier of the customer to retrieve.                                                                                                                              | external_12345                                                                                                                                                                    |
| `x_organization_id`                                                                                                                                                               | *T.nilable(::String)*                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                | The unique identifier for the organization making the request                                                                                                                     | org_12345                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::GetCustomerByExternalIdV1CustomersExternalExternalIdGetResponse)](../../models/operations/getcustomerbyexternalidv1customersexternalexternalidgetresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## get_transactions

Get a list of transactions for a customer by their unique ID.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.customers.get_transactions(security: Models::Operations::GetTransactionsByCustomerIdV1CustomersCustomerIdTransactionsGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), customer_id: '<id>', x_organization_id: 'org_12345')

unless res.response_get_transactions_by_customer_id_v1_customers_customer_id_transactions_get.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                         | Type                                                                                                                                                                                              | Required                                                                                                                                                                                          | Description                                                                                                                                                                                       | Example                                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                        | [Models::Operations::GetTransactionsByCustomerIdV1CustomersCustomerIdTransactionsGetSecurity](../../models/operations/gettransactionsbycustomeridv1customerscustomeridtransactionsgetsecurity.md) | :heavy_check_mark:                                                                                                                                                                                | The security requirements to use for the request.                                                                                                                                                 |                                                                                                                                                                                                   |
| `customer_id`                                                                                                                                                                                     | *::String*                                                                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                                | N/A                                                                                                                                                                                               |                                                                                                                                                                                                   |
| `x_organization_id`                                                                                                                                                                               | *T.nilable(::String)*                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                | The unique identifier for the organization making the request                                                                                                                                     | org_12345                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::GetTransactionsByCustomerIdV1CustomersCustomerIdTransactionsGetResponse)](../../models/operations/gettransactionsbycustomeridv1customerscustomeridtransactionsgetresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## create_transaction

Create a new transaction for a specific customer.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.customers.create_transaction(security: Models::Operations::CreateTransactionByCustomerIdV1CustomersCustomerIdTransactionsPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), customer_id: '<id>', x_organization_id: 'org_12345', transaction_create: Models::Components::TransactionCreate.new(
  organization_id: '<id>',
  external_id: '<id>',
  date: DateTime.iso8601('2023-02-16T04:36:50.697Z'),
  addresses: [],
  transaction_items: [],
))

unless res.transaction_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                               | Type                                                                                                                                                                                                    | Required                                                                                                                                                                                                | Description                                                                                                                                                                                             | Example                                                                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                              | [Models::Operations::CreateTransactionByCustomerIdV1CustomersCustomerIdTransactionsPostSecurity](../../models/operations/createtransactionbycustomeridv1customerscustomeridtransactionspostsecurity.md) | :heavy_check_mark:                                                                                                                                                                                      | The security requirements to use for the request.                                                                                                                                                       |                                                                                                                                                                                                         |
| `customer_id`                                                                                                                                                                                           | *::String*                                                                                                                                                                                              | :heavy_check_mark:                                                                                                                                                                                      | N/A                                                                                                                                                                                                     |                                                                                                                                                                                                         |
| `x_organization_id`                                                                                                                                                                                     | *T.nilable(::String)*                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                      | The unique identifier for the organization making the request                                                                                                                                           | org_12345                                                                                                                                                                                               |
| `transaction_create`                                                                                                                                                                                    | [Models::Components::TransactionCreate](../../models/shared/transactioncreate.md)                                                                                                                       | :heavy_check_mark:                                                                                                                                                                                      | N/A                                                                                                                                                                                                     |                                                                                                                                                                                                         |

### Response

**[T.nilable(Models::Operations::CreateTransactionByCustomerIdV1CustomersCustomerIdTransactionsPostResponse)](../../models/operations/createtransactionbycustomeridv1customerscustomeridtransactionspostresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |