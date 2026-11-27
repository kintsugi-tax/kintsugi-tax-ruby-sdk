# TaxTypeEnum

Tax obligation on a nexus, registration, or filing row.

Registrations and filings may be SALES_AND_USE_TAX: one state account and
one return can cover both taxes, and each is stored as a single row.
Nexus rows are SALES_TAX, USE_TAX, RETAIL_DELIVERY_FEE, SMALL_PARCEL_VAT,
or LEASE_TAX. Each of these is a separate obligation. Each has its own met
dates and period models. SMALL_PARCEL_VAT is a threshold only. A sales tax
registration covers it, and it has no account and no return of its own.
LEASE_TAX is a city tax on leased goods, such as the
Chicago lease tax. It has its own account and return.

## Example Usage

```ruby
require "kintsugi_sdk"

value = TaxTypeEnum::SALES_TAX
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `SALES_TAX`           | SALES_TAX             |
| `USE_TAX`             | USE_TAX               |
| `SALES_AND_USE_TAX`   | SALES_AND_USE_TAX     |
| `RETAIL_DELIVERY_FEE` | RETAIL_DELIVERY_FEE   |
| `SMALL_PARCEL_VAT`    | SMALL_PARCEL_VAT      |
| `LEASE_TAX`           | LEASE_TAX             |