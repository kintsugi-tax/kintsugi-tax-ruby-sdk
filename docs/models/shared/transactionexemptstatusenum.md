# TransactionExemptStatusEnum

Based on transaction item exempt status.
NOT EXEMPT: None of the items are NOT EXEMPT
PARTIALLY EXEMPT: At least some of the items are NOT EXEMPT
FULLY_EXEMPT: All items sold in the transaction are EXEMPT
ZERO_RATE_NOT_EXEMPT: All items sold in the transaction are zero-rated

## Example Usage

```ruby
require "kintsugi_sdk"

value = TransactionExemptStatusEnum::NOT_EXEMPT
```


## Values

| Name                   | Value                  |
| ---------------------- | ---------------------- |
| `NOT_EXEMPT`           | NOT_EXEMPT             |
| `PARTIALLY_EXEMPT`     | PARTIALLY_EXEMPT       |
| `FULLY_EXEMPT`         | FULLY_EXEMPT           |
| `ZERO_RATE_NOT_EXEMPT` | ZERO_RATE_NOT_EXEMPT   |