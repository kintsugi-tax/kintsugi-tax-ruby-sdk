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

<!-- UsageSnippet language="ruby" operationID="get_products_v1_products__get" method="get" path="/v1/products/" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetProductsV1ProductsGetRequest.new()

res = s.products.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                  | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                  | [Models::Ops::GetProductsV1ProductsGetRequest](../../models/operations/getproductsv1productsgetrequest.md) | :heavy_check_mark:                                                                                         | The request object to use for the request.                                                                 |

### Response

**[T.nilable(Models::Shared::PageProductRead)](../../models/operations/pageproductread.md)**

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

<!-- UsageSnippet language="ruby" operationID="create_product_v1_products__post" method="post" path="/v1/products/" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Shared::ProductCreateManual.new(
  external_id: 'prod_001',
  name: 'Sample Product',
  description: 'A description of the product',
  status: Models::Shared::ProductStatusEnum::APPROVED,
  product_category: Models::Shared::ProductCategoryEnum::PHYSICAL,
  product_subcategory: Models::Shared::ProductSubCategoryEnum::GENERAL_CLOTHING,
  tax_exempt: false,
  source: Models::Shared::SourceEnum::BIGCOMMERCE,
)

res = s.products.create(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                         | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `request`                                                                         | [Models::Shared::ProductCreateManual](../../models/shared/productcreatemanual.md) | :heavy_check_mark:                                                                | The request object to use for the request.                                        |

### Response

**[T.nilable(Models::Shared::ProductRead)](../../models/operations/productread.md)**

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

<!-- UsageSnippet language="ruby" operationID="get_product_by_id_v1_products__product_id__get" method="get" path="/v1/products/{product_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetProductByIdV1ProductsProductIdGetRequest.new(
  product_id: '<id>',
)

res = s.products.get(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                          | Type                                                                                                                               | Required                                                                                                                           | Description                                                                                                                        |
| ---------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                          | [Models::Ops::GetProductByIdV1ProductsProductIdGetRequest](../../models/operations/getproductbyidv1productsproductidgetrequest.md) | :heavy_check_mark:                                                                                                                 | The request object to use for the request.                                                                                         |

### Response

**[T.nilable(Models::Shared::ProductRead)](../../models/operations/productread.md)**

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

<!-- UsageSnippet language="ruby" operationID="update_product_v1_products__product_id__put" method="put" path="/v1/products/{product_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::UpdateProductV1ProductsProductIdPutRequest.new(
  product_id: '<id>',
  product_update: Models::Shared::ProductUpdate.new(
    external_id: 'prod_001',
    name: 'Updated Product Name',
    description: 'An updated description for the product',
    status: Models::Shared::ProductStatusEnum::APPROVED,
    product_category: Models::Shared::ProductCategoryEnum::PHYSICAL,
    product_subcategory: Models::Shared::ProductSubCategoryEnum::GENERAL_CLOTHING,
    tax_exempt: false,
  ),
)

res = s.products.update(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                        | Type                                                                                                                             | Required                                                                                                                         | Description                                                                                                                      |
| -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                                        | [Models::Ops::UpdateProductV1ProductsProductIdPutRequest](../../models/operations/updateproductv1productsproductidputrequest.md) | :heavy_check_mark:                                                                                                               | The request object to use for the request.                                                                                       |

### Response

**[T.nilable(Models::Shared::ProductRead)](../../models/operations/productread.md)**

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

<!-- UsageSnippet language="ruby" operationID="get_product_categories_v1_products_categories__get" method="get" path="/v1/products/categories/" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

res = s.products.list_categories()

unless res.nil?
  # handle response
end

```

### Response

**[T.nilable(T::Array[Models::Shared::ProductCategories])](../../models/operations/.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |