<!-- Start SDK Example Usage [usage] -->
```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Components::AddressBase.new(
  phone: '555-123-4567',
  street_1: '1600 Amphitheatre Parkway',
  street_2: 'Building 40',
  city: 'Mountain View',
  county: 'Santa Clara',
  state: 'CA',
  postal_code: '94043',
  country: Models::Components::CountryCodeEnum::US,
  full_address: '1600 Amphitheatre Parkway, Mountain View, CA 94043',
)

res = s.address_validation.search(request: req, security: Models::Operations::SearchV1AddressValidationSearchPostSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.response_200_search_v1_address_validation_search_post.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->