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

<!-- UsageSnippet language="ruby" operationID="get_customers_v1" method="get" path="/v1/customers" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetCustomersV1Request.new(
  search_query: 'John',
  country: [

  ],
  state: 'CA',
  source_in: 'SHOPIFY,API',
  order_by: 'created_at,street_1,street_2,city,state,postal_code,country,status',
)

res = s.customers.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                              | Type                                                                                   | Required                                                                               | Description                                                                            |
| -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `request`                                                                              | [Models::Ops::GetCustomersV1Request](../../models/operations/getcustomersv1request.md) | :heavy_check_mark:                                                                     | The request object to use for the request.                                             |

### Response

**[T.nilable(Models::Shared::PageCustomerRead)](../../models/operations/pagecustomerread.md)**

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

<!-- UsageSnippet language="ruby" operationID="create_customer_v1_customers_post" method="post" path="/v1/customers" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Shared::CustomerCreate.new(
  phone: '987-654-3210',
  street_1: '456 Elm St',
  street_2: 'Suite 202',
  city: 'Metropolis',
  county: 'Wayne',
  state: 'NY',
  postal_code: '10001',
  country: Models::Shared::CountryCodeEnum::US,
  name: 'Jane Smith',
  external_id: 'cust_002',
  status: Models::Shared::StatusEnum::ARCHIVED,
  email: 'jane.smith@example.com',
  source: Models::Shared::SourceEnum::SHOPIFY,
  address_status: Models::Shared::AddressStatus::PARTIALLY_VERIFIED,
)

res = s.customers.create(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                               | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `request`                                                               | [Models::Shared::CustomerCreate](../../models/shared/customercreate.md) | :heavy_check_mark:                                                      | The request object to use for the request.                              |

### Response

**[T.nilable(Models::Shared::CustomerRead)](../../models/operations/customerread.md)**

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

<!-- UsageSnippet language="ruby" operationID="get_customer_by_id_v1_customers__customer_id__get" method="get" path="/v1/customers/{customer_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetCustomerByIdV1CustomersCustomerIdGetRequest.new(
  customer_id: 'cust_abc123',
)

res = s.customers.get(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                | Type                                                                                                                                     | Required                                                                                                                                 | Description                                                                                                                              |
| ---------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                                | [Models::Ops::GetCustomerByIdV1CustomersCustomerIdGetRequest](../../models/operations/getcustomerbyidv1customerscustomeridgetrequest.md) | :heavy_check_mark:                                                                                                                       | The request object to use for the request.                                                                                               |

### Response

**[T.nilable(Models::Shared::CustomerRead)](../../models/operations/customerread.md)**

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

<!-- UsageSnippet language="ruby" operationID="update_customer_v1_customers__customer_id__put" method="put" path="/v1/customers/{customer_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::UpdateCustomerV1CustomersCustomerIdPutRequest.new(
  customer_id: '<id>',
  customer_update: Models::Shared::CustomerUpdate.new(
    phone: '987-654-3210',
    street_1: '456 Elm St',
    street_2: 'Suite 202',
    city: 'Metropolis',
    county: 'Wayne',
    state: 'NY',
    postal_code: '10001',
    country: Models::Shared::CountryCodeEnum::US,
    full_address: '456 Elm St, Suite 202, Metropolis, NY 10001, US',
    name: 'Jane Smith',
    status: Models::Shared::StatusEnum::ACTIVE,
    email: 'john.doe@example.com',
    source: Models::Shared::SourceEnum::SHOPIFY,
    address_status: Models::Shared::AddressStatus::VERIFIED,
    external_id: 'cust_002',
  ),
)

res = s.customers.update(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                              | Type                                                                                                                                   | Required                                                                                                                               | Description                                                                                                                            |
| -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                              | [Models::Ops::UpdateCustomerV1CustomersCustomerIdPutRequest](../../models/operations/updatecustomerv1customerscustomeridputrequest.md) | :heavy_check_mark:                                                                                                                     | The request object to use for the request.                                                                                             |

### Response

**[T.nilable(Models::Shared::CustomerRead)](../../models/operations/customerread.md)**

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

<!-- UsageSnippet language="ruby" operationID="get_customer_by_external_id_v1_customers_external__external_id__get" method="get" path="/v1/customers/external/{external_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetCustomerByExternalIdV1CustomersExternalExternalIdGetRequest.new(
  external_id: 'external_12345',
)

res = s.customers.get_by_external_id(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                | Type                                                                                                                                                                     | Required                                                                                                                                                                 | Description                                                                                                                                                              |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `request`                                                                                                                                                                | [Models::Ops::GetCustomerByExternalIdV1CustomersExternalExternalIdGetRequest](../../models/operations/getcustomerbyexternalidv1customersexternalexternalidgetrequest.md) | :heavy_check_mark:                                                                                                                                                       | The request object to use for the request.                                                                                                                               |

### Response

**[T.nilable(Models::Shared::CustomerRead)](../../models/operations/customerread.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## get_transactions

Get a list of transactions for a customer by their unique ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getTransactionsByCustomer" method="get" path="/v1/customers/{customer_id}/transactions" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetTransactionsByCustomerRequest.new(
  customer_id: '<id>',
)

res = s.customers.get_transactions(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                    | Type                                                                                                         | Required                                                                                                     | Description                                                                                                  |
| ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------ |
| `request`                                                                                                    | [Models::Ops::GetTransactionsByCustomerRequest](../../models/operations/gettransactionsbycustomerrequest.md) | :heavy_check_mark:                                                                                           | The request object to use for the request.                                                                   |

### Response

**[T.nilable(T::Array[Models::Shared::TransactionRead])](../../models/operations/.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## create_transaction

Create a new transaction for a specific customer.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createTransactionByCustomer" method="post" path="/v1/customers/{customer_id}/transactions" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::CreateTransactionByCustomerRequest.new(
  customer_id: '<id>',
  transaction_create: Models::Shared::TransactionCreate.new(
    organization_id: '<id>',
    external_id: '<id>',
    date: DateTime.iso8601('2025-04-30T23:54:13.835Z'),
    total_amount: 0.0,
    total_tax_amount_imported: 0.0,
    tax_rate_imported: 0.0,
    total_tax_amount_calculated: 0.0,
    tax_rate_calculated: 0.0,
    total_tax_liability_amount: 0.0,
    taxable_amount: 0.0,
    addresses: [],
    transaction_items: [
      Models::Shared::TransactionItemCreateUpdate.new(
        organization_id: '<id>',
        date: DateTime.iso8601('2023-12-30T23:49:45.106Z'),
        external_product_id: '<id>',
        quantity: 1.0,
        amount: 0.0,
        tax_amount_imported: 0.0,
        tax_rate_imported: 0.0,
        tax_amount_calculated: 0.0,
        tax_rate_calculated: 0.0,
        taxable_amount: 0.0,
      ),
    ],
  ),
)

res = s.customers.create_transaction(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                        | Type                                                                                                             | Required                                                                                                         | Description                                                                                                      |
| ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                        | [Models::Ops::CreateTransactionByCustomerRequest](../../models/operations/createtransactionbycustomerrequest.md) | :heavy_check_mark:                                                                                               | The request object to use for the request.                                                                       |

### Response

**[T.nilable(Models::Shared::TransactionRead)](../../models/operations/transactionread.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |