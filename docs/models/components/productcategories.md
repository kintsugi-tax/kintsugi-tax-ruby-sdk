# ProductCategories


## Fields

| Field                                                                                         | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `name`                                                                                        | *::String*                                                                                    | :heavy_check_mark:                                                                            | Name of the product category<br/>            (e.g., PHYSICAL, SERVICE, DIGITAL, MISCELLANEOUS) |
| `subcategories`                                                                               | T::Array<[Models::Components::ProductSubCategory](../../models/shared/productsubcategory.md)> | :heavy_check_mark:                                                                            | List of subcategories associated with the product category                                    |