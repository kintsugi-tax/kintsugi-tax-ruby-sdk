# TaxItemReturnReasonEnum

We use this to understand the response from get_tax_items

## Example Usage

```ruby
require "kintsugi_sdk"

value = TaxItemReturnReasonEnum::NO_RULE_FOUND
```


## Values

| Name                              | Value                             |
| --------------------------------- | --------------------------------- |
| `NO_RULE_FOUND`                   | NO_RULE_FOUND                     |
| `ALL_RATES_OPTED_OUT`             | ALL_RATES_OPTED_OUT               |
| `RULE_FOUND_TAXABLE`              | RULE_FOUND_TAXABLE                |
| `RULE_FOUND_NOT_TAXABLE`          | RULE_FOUND_NOT_TAXABLE            |
| `RULE_FOUND_TAXABLE_ZERO_RATE`    | RULE_FOUND_TAXABLE_ZERO_RATE      |
| `PRODUCT_EXEMPT`                  | PRODUCT_EXEMPT                    |
| `FROM_IMPORT`                     | FROM_IMPORT                       |
| `RULE_EXCLUDED_IN_CALCULATION`    | RULE_EXCLUDED_IN_CALCULATION      |
| `REVERSE_CHARGE`                  | REVERSE_CHARGE                    |
| `RULE_FOUND_SUPPRESSED_BY_COUNTY` | RULE_FOUND_SUPPRESSED_BY_COUNTY   |