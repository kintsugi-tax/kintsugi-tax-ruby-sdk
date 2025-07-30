# HTTPValidationError


## Fields

| Field                                                                                   | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `detail`                                                                                | T::Array<[Models::Components::ValidationError](../../models/shared/validationerror.md)> | :heavy_minus_sign:                                                                      | N/A                                                                                     |
| `raw_response`                                                                          | [Faraday::Response](https://www.rubydoc.info/gems/faraday/Faraday/Response)             | :heavy_minus_sign:                                                                      | Raw HTTP response; suitable for custom response parsing                                 |