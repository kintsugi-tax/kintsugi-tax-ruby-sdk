# Products
(*products*)

## Overview

### Available Operations

* [list](#list) - Get Products
* [create](#create) - Create Product
* [get](#get) - Get Product By Id
* [update](#update) - Update Product
* [list_categories](#list_categories) - Get Product Categories

## list

Retrieve a paginated list of products based on filters and search query.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Operations::GetProductsV1ProductsGetRequest.new(
  x_organization_id: 'org_12345',
)

res = s.products.list(request: req, security: Models::Operations::GetProductsV1ProductsGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.page_product_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                           | Type                                                                                                                | Required                                                                                                            | Description                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                           | [Models::Operations::GetProductsV1ProductsGetRequest](../../models/operations/getproductsv1productsgetrequest.md)   | :heavy_check_mark:                                                                                                  | The request object to use for the request.                                                                          |
| `security`                                                                                                          | [Models::Operations::GetProductsV1ProductsGetSecurity](../../models/operations/getproductsv1productsgetsecurity.md) | :heavy_check_mark:                                                                                                  | The security requirements to use for the request.                                                                   |

### Response

**[T.nilable(Models::Operations::GetProductsV1ProductsGetResponse)](../../models/operations/getproductsv1productsgetresponse.md)**

### Errors

| Error Type                                                         | Status Code                                                        | Content Type                                                       |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ |
| Models::Errors::ErrorResponse                                      | 401, 404                                                           | application/json                                                   |
| Models::Errors::BackendSrcProductsResponsesValidationErrorResponse | 422                                                                | application/json                                                   |
| Models::Errors::ErrorResponse                                      | 500                                                                | application/json                                                   |
| Errors::APIError                                                   | 4XX, 5XX                                                           | \*/\*                                                              |

## create

The Create Product API allows users to manually create a new product
    in the system. This includes specifying product details such as category,
    subcategory, and tax exemption status, etc.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.products.create(security: Models::Operations::CreateProductV1ProductsPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), x_organization_id: 'org_12345', product_create_manual: Models::Components::ProductCreateManual.new(
  external_id: 'prod_001',
  name: 'Sample Product',
  description: 'A description of the product',
  status: Models::Components::ProductStatusEnum::APPROVED,
  product_category: Models::Components::ProductCategoryEnum::PHYSICAL,
  product_subcategory: Models::Components::ProductSubCategoryEnum::GENERAL_CLOTHING,
  tax_exempt: false,
  source: Models::Components::SourceEnum::BIGCOMMERCE,
))

unless res.product_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                 | Type                                                                                                                      | Required                                                                                                                  | Description                                                                                                               | Example                                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                | [Models::Operations::CreateProductV1ProductsPostSecurity](../../models/operations/createproductv1productspostsecurity.md) | :heavy_check_mark:                                                                                                        | The security requirements to use for the request.                                                                         |                                                                                                                           |
| `x_organization_id`                                                                                                       | *T.nilable(::String)*                                                                                                     | :heavy_check_mark:                                                                                                        | The unique identifier for the organization making the request                                                             | org_12345                                                                                                                 |
| `product_create_manual`                                                                                                   | [Models::Components::ProductCreateManual](../../models/shared/productcreatemanual.md)                                     | :heavy_check_mark:                                                                                                        | N/A                                                                                                                       |                                                                                                                           |

### Response

**[T.nilable(Models::Operations::CreateProductV1ProductsPostResponse)](../../models/operations/createproductv1productspostresponse.md)**

### Errors

| Error Type                                                         | Status Code                                                        | Content Type                                                       |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ |
| Models::Errors::ErrorResponse                                      | 401                                                                | application/json                                                   |
| Models::Errors::BackendSrcProductsResponsesValidationErrorResponse | 422                                                                | application/json                                                   |
| Models::Errors::ErrorResponse                                      | 500                                                                | application/json                                                   |
| Errors::APIError                                                   | 4XX, 5XX                                                           | \*/\*                                                              |

## get

The Get Product By ID API retrieves detailed information about
    a single product by its unique ID. This API helps in viewing the specific details
    of a product, including its attributes, status, and categorization.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.products.get(security: Models::Operations::GetProductByIdV1ProductsProductIdGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), product_id: '<id>', x_organization_id: 'org_12345')

unless res.product_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                   | Type                                                                                                                                        | Required                                                                                                                                    | Description                                                                                                                                 | Example                                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                  | [Models::Operations::GetProductByIdV1ProductsProductIdGetSecurity](../../models/operations/getproductbyidv1productsproductidgetsecurity.md) | :heavy_check_mark:                                                                                                                          | The security requirements to use for the request.                                                                                           |                                                                                                                                             |
| `product_id`                                                                                                                                | *::String*                                                                                                                                  | :heavy_check_mark:                                                                                                                          | The unique identifier for the product you want to retrieve.                                                                                 |                                                                                                                                             |
| `x_organization_id`                                                                                                                         | *T.nilable(::String)*                                                                                                                       | :heavy_check_mark:                                                                                                                          | The unique identifier for the organization making the request                                                                               | org_12345                                                                                                                                   |

### Response

**[T.nilable(Models::Operations::GetProductByIdV1ProductsProductIdGetResponse)](../../models/operations/getproductbyidv1productsproductidgetresponse.md)**

### Errors

| Error Type                                                         | Status Code                                                        | Content Type                                                       |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ |
| Models::Errors::ErrorResponse                                      | 401                                                                | application/json                                                   |
| Models::Errors::BackendSrcProductsResponsesValidationErrorResponse | 422                                                                | application/json                                                   |
| Models::Errors::ErrorResponse                                      | 500                                                                | application/json                                                   |
| Errors::APIError                                                   | 4XX, 5XX                                                           | \*/\*                                                              |

## update

The Update Product API allows users to modify the details of
    an existing product identified by its unique product_id

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.products.update(security: Models::Operations::UpdateProductV1ProductsProductIdPutSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), product_id: '<id>', x_organization_id: 'org_12345', request_body: Models::Components::ProductUpdateV2.new(
  name: 'Updated Product Name',
  status: Models::Components::ProductStatusEnum::APPROVED,
  product_category: 'PHYSICAL',
  product_subcategory: 'GENERAL_CLOTHING',
  tax_exempt: false,
  external_id: 'prod_001',
  description: 'An updated description for the product',
  classification_failed: false,
))

unless res.product_read.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                 | Type                                                                                                                                      | Required                                                                                                                                  | Description                                                                                                                               | Example                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                | [Models::Operations::UpdateProductV1ProductsProductIdPutSecurity](../../models/operations/updateproductv1productsproductidputsecurity.md) | :heavy_check_mark:                                                                                                                        | The security requirements to use for the request.                                                                                         |                                                                                                                                           |
| `product_id`                                                                                                                              | *::String*                                                                                                                                | :heavy_check_mark:                                                                                                                        | Unique identifier of the product to be updated.                                                                                           |                                                                                                                                           |
| `x_organization_id`                                                                                                                       | *T.nilable(::String)*                                                                                                                     | :heavy_check_mark:                                                                                                                        | The unique identifier for the organization making the request                                                                             | org_12345                                                                                                                                 |
| `request_body`                                                                                                                            | [T.any(Models::Components::ProductUpdate, Models::Components::ProductUpdateV2)](../../models/operations/product.md)                       | :heavy_check_mark:                                                                                                                        | N/A                                                                                                                                       |                                                                                                                                           |

### Response

**[T.nilable(Models::Operations::UpdateProductV1ProductsProductIdPutResponse)](../../models/operations/updateproductv1productsproductidputresponse.md)**

### Errors

| Error Type                                                         | Status Code                                                        | Content Type                                                       |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ | ------------------------------------------------------------------ |
| Models::Errors::ErrorResponse                                      | 401                                                                | application/json                                                   |
| Models::Errors::BackendSrcProductsResponsesValidationErrorResponse | 422                                                                | application/json                                                   |
| Models::Errors::ErrorResponse                                      | 500                                                                | application/json                                                   |
| Errors::APIError                                                   | 4XX, 5XX                                                           | \*/\*                                                              |

## list_categories

The Get Product Categories API retrieves all
    product categories.  This endpoint helps users understand and select the
    appropriate categories for their products.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.products.list_categories(security: Models::Operations::GetProductCategoriesV1ProductsCategoriesGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), x_organization_id: 'org_12345')

unless res.response_get_product_categories_v1_products_categories_get.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                 | Type                                                                                                                                                      | Required                                                                                                                                                  | Description                                                                                                                                               | Example                                                                                                                                                   |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                | [Models::Operations::GetProductCategoriesV1ProductsCategoriesGetSecurity](../../models/operations/getproductcategoriesv1productscategoriesgetsecurity.md) | :heavy_check_mark:                                                                                                                                        | The security requirements to use for the request.                                                                                                         |                                                                                                                                                           |
| `x_organization_id`                                                                                                                                       | *T.nilable(::String)*                                                                                                                                     | :heavy_check_mark:                                                                                                                                        | The unique identifier for the organization making the request                                                                                             | org_12345                                                                                                                                                 |

### Response

**[T.nilable(Models::Operations::GetProductCategoriesV1ProductsCategoriesGetResponse)](../../models/operations/getproductcategoriesv1productscategoriesgetresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |