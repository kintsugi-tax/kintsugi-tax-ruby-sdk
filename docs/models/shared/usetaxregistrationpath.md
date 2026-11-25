# UseTaxRegistrationPath

What Register does with a use tax row, as the nexus response reports it.

- ABSORBED: Register folds the row into the org's live sales tax registration
- SEPARATE: the state always keeps use tax on its own registration
- NONE: everything else, and always NONE on a row that is not use tax

## Example Usage

```ruby
require "kintsugi_sdk"

value = UseTaxRegistrationPath::ABSORBED
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `ABSORBED` | ABSORBED   |
| `SEPARATE` | SEPARATE   |
| `NONE`     | NONE       |