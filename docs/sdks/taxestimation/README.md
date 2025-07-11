# TaxEstimation
(*tax_estimation*)

## Overview

### Available Operations

* [estimate_tax](#estimate_tax) - Estimate Tax

## estimate_tax

The Estimate Tax API calculates the estimated tax for a specific
    transaction based on the provided details, including organization nexus,
    transaction details, customer details, and addresses. Optionally simulates nexus being met for tax calculation purposes. The `simulate_nexus_met` parameter is deprecated and will be removed in future releases.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

res = s.tax_estimation.estimate_tax(security: Models::Operations::EstimateTaxV1TaxEstimatePostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ), x_organization_id: 'org_12345', transaction_estimate_request: Models::Components::TransactionEstimateRequest.new(
  date: DateTime.iso8601('2025-01-23T13:01:29.949Z'),
  external_id: 'txn_12345',
  currency: Models::Components::CurrencyEnum::USD,
  addresses: [
    Models::Components::TransactionEstimateRequestAddress.new(
      type: Models::Components::TransactionEstimateRequestType::SHIP_TO,
      street_1: '789 Pine St',
      city: 'Austin',
      state: 'TX',
      postal_code: '78701',
      country: 'US',
    ),
  ],
  transaction_items: [
    Models::Components::TransactionItemEstimateBase.new(
      external_id: 'item_A',
      date: DateTime.iso8601('2024-10-28T10:00:00Z'),
      external_product_id: 'prod_abc',
      quantity: 2.0,
      amount: 100.0,
    ),
    Models::Components::TransactionItemEstimateBase.new(
      external_id: 'item_B',
      date: DateTime.iso8601('2024-10-28T10:00:00Z'),
      external_product_id: 'prod_xyz',
      quantity: 1.0,
      amount: 75.5,
    ),
  ],
))

unless res.page_transaction_estimate_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                | Type                                                                                                                                                                                                     | Required                                                                                                                                                                                                 | Description                                                                                                                                                                                              | Example                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `security`                                                                                                                                                                                               | [Models::Operations::EstimateTaxV1TaxEstimatePostSecurity](../../models/operations/estimatetaxv1taxestimatepostsecurity.md)                                                                              | :heavy_check_mark:                                                                                                                                                                                       | The security requirements to use for the request.                                                                                                                                                        |                                                                                                                                                                                                          |
| `x_organization_id`                                                                                                                                                                                      | *T.nilable(::String)*                                                                                                                                                                                    | :heavy_check_mark:                                                                                                                                                                                       | The unique identifier for the organization making the request                                                                                                                                            | org_12345                                                                                                                                                                                                |
| `transaction_estimate_request`                                                                                                                                                                           | [Models::Components::TransactionEstimateRequest](../../models/shared/transactionestimaterequest.md)                                                                                                      | :heavy_check_mark:                                                                                                                                                                                       | N/A                                                                                                                                                                                                      |                                                                                                                                                                                                          |
| `simulate_nexus_met`                                                                                                                                                                                     | *T.nilable(T::Boolean)*                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                       | : warning: ** DEPRECATED **: This will be removed in a future release, please migrate away from it as soon as possible.<br/><br/>**Deprecated:** Use `simulate_active_registration` in the request body instead. |                                                                                                                                                                                                          |

### Response

**[T.nilable(Models::Operations::EstimateTaxV1TaxEstimatePostResponse)](../../models/operations/estimatetaxv1taxestimatepostresponse.md)**

### Errors

| Error Type                                                              | Status Code                                                             | Content Type                                                            |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                           | 401                                                                     | application/json                                                        |
| Models::Errors::BackendSrcTaxEstimationResponsesValidationErrorResponse | 422                                                                     | application/json                                                        |
| Models::Errors::ErrorResponse                                           | 500                                                                     | application/json                                                        |
| Errors::APIError                                                        | 4XX, 5XX                                                                | \*/\*                                                                   |