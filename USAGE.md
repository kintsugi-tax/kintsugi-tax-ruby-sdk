<!-- Start SDK Example Usage [usage] -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new

req = Models::Shared::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Shared::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
)

res = s.address_validation.search(request: req, security: Models::Ops::SearchV1AddressValidationSearchPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->