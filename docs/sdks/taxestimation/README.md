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

<!-- UsageSnippet language="ruby" operationID="estimate_tax_v1_tax_estimate_post" method="post" path="/v1/tax/estimate" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::EstimateTaxV1TaxEstimatePostRequest.new(
  transaction_estimate_public_request: Models::Shared::TransactionEstimatePublicRequest.new(
    date: DateTime.iso8601('2025-01-23T13:01:29.949Z'),
    external_id: 'txn_12345',
    currency: Models::Shared::CurrencyEnum::USD,
    transaction_items: [
      Models::Shared::TransactionItemEstimateBase.new(
        external_id: 'item_A',
        date: DateTime.iso8601('2024-10-28T10:00:00Z'),
        external_product_id: 'prod_abc',
        quantity: 2.0,
        amount: 100.0,
      ),
      Models::Shared::TransactionItemEstimateBase.new(
        external_id: 'item_B',
        date: DateTime.iso8601('2024-10-28T10:00:00Z'),
        external_product_id: 'prod_xyz',
        quantity: 1.0,
        amount: 75.5,
      ),
    ],
    addresses: [
      Models::Shared::Addresses.new(
        type: Models::Shared::Type::SHIP_TO,
        street_1: '789 Pine St',
        city: 'Austin',
        state: 'TX',
        postal_code: '78701',
        country: 'US',
      ),
    ],
  ),
)

res = s.tax_estimation.estimate_tax(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                          | Type                                                                                                               | Required                                                                                                           | Description                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| `request`                                                                                                          | [Models::Ops::EstimateTaxV1TaxEstimatePostRequest](../../models/operations/estimatetaxv1taxestimatepostrequest.md) | :heavy_check_mark:                                                                                                 | The request object to use for the request.                                                                         |

### Response

**[T.nilable(Models::Shared::PageTransactionEstimateResponse)](../../models/operations/pagetransactionestimateresponse.md)**

### Errors

| Error Type                                                              | Status Code                                                             | Content Type                                                            |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Models::Errors::ErrorResponse                                           | 401                                                                     | application/json                                                        |
| Models::Errors::BackendSrcTaxEstimationResponsesValidationErrorResponse | 422                                                                     | application/json                                                        |
| Models::Errors::ErrorResponse                                           | 500                                                                     | application/json                                                        |
| Errors::APIError                                                        | 4XX, 5XX                                                                | \*/\*                                                                   |