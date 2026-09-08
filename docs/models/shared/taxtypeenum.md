# TaxTypeEnum

Tax obligation on a nexus, registration, or filing row.

Registrations and filings may be SALES_AND_USE_TAX: one state account and
one return can cover both taxes, and each is stored as a single row.
Nexus rows are only SALES_TAX or USE_TAX. Sales and use tax exposure are
separate obligations with their own met dates, period models, and liability
accrual.

## Example Usage

```ruby
require "kintsugi_sdk"

value = TaxTypeEnum::SALES_TAX
```


## Values

| Name                | Value               |
| ------------------- | ------------------- |
| `SALES_TAX`         | SALES_TAX           |
| `USE_TAX`           | USE_TAX             |
| `SALES_AND_USE_TAX` | SALES_AND_USE_TAX   |