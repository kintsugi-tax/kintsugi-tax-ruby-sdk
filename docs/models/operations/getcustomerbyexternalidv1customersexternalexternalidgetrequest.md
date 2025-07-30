# GetCustomerByExternalIdV1CustomersExternalExternalIdGetRequest


## Fields

| Field                                                         | Type                                                          | Required                                                      | Description                                                   | Example                                                       |
| ------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- |
| `external_id`                                                 | *::String*                                                    | :heavy_check_mark:                                            | The external identifier of the customer to retrieve.          | external_12345                                                |
| `x_organization_id`                                           | *T.nilable(::String)*                                         | :heavy_check_mark:                                            | The unique identifier for the organization making the request | org_12345                                                     |