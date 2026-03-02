# Products

## Overview

### Available Operations

* [get](#get) - Get Product By Id
* [update](#update) - Update Product

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
    custom_header: '<YOUR_API_KEY_HERE>'
  )
)

req = Models::Ops::GetProductByIdV1ProductsProductIdGetRequest.new(
  product_id: '<id>'
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
    an existing product identified by its unique product_id. You can
    retrieve supported categories and subcategories from
    [GET /products/categories endpoint](/reference/api/products/get-product-categories)

### Example Usage

<!-- UsageSnippet language="ruby" operationID="update_product_v1_products__product_id__put" method="put" path="/v1/products/{product_id}" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
  security: Models::Shared::Security.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
    custom_header: '<YOUR_API_KEY_HERE>'
  )
)

req = Models::Ops::UpdateProductV1ProductsProductIdPutRequest.new(
  product_id: '<id>',
  product_update: Models::Shared::ProductUpdate.new(
    external_id: 'prod_001',
    name: 'Updated T-Shirt',
    description: 'An updated description for the product',
    status: Models::Shared::ProductStatusEnum::APPROVED,
    product_category: 'Physical',
    product_subcategory: 'General Clothing',
    tax_exempt: false
  )
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