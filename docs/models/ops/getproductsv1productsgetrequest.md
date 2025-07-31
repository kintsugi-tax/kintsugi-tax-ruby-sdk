# GetProductsV1ProductsGetRequest


## Fields

| Field                                                    | Type                                                     | Required                                                 | Description                                              |
| -------------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------- |
| `query`                                                  | *T.nilable(::String)*                                    | :heavy_minus_sign:                                       | Search term to filter products by name or other details. |
| `status_in`                                              | *T.nilable(::String)*                                    | :heavy_minus_sign:                                       | Filter products by status (comma-separated)              |
| `product_category_in`                                    | *T.nilable(::String)*                                    | :heavy_minus_sign:                                       | Filter products by category (comma-separated)            |
| `product_subcategory_in`                                 | *T.nilable(::String)*                                    | :heavy_minus_sign:                                       | Filter products by subcategory (comma-separated)         |
| `source_in`                                              | *T.nilable(::String)*                                    | :heavy_minus_sign:                                       | Filter products by source (comma-separated)              |
| `order_by`                                               | *T.nilable(::String)*                                    | :heavy_minus_sign:                                       | Order results by specified fields (comma-separated)      |
| `page`                                                   | *T.nilable(::Integer)*                                   | :heavy_minus_sign:                                       | Page number                                              |
| `size`                                                   | *T.nilable(::Integer)*                                   | :heavy_minus_sign:                                       | Page size                                                |