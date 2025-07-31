# BackendSrcCustomersResponsesValidationErrorItem


## Fields

| Field                       | Type                        | Required                    | Description                 |
| --------------------------- | --------------------------- | --------------------------- | --------------------------- |
| `type`                      | *::String*                  | :heavy_check_mark:          | Type of validation error    |
| `loc`                       | T::Array<*::String*>        | :heavy_check_mark:          | Location of error           |
| `msg`                       | *::String*                  | :heavy_check_mark:          | Error message               |
| `input`                     | *::Object*                  | :heavy_check_mark:          | Invalid input value         |
| `ctx`                       | T::Hash[Symbol, *::Object*] | :heavy_check_mark:          | Additional context          |