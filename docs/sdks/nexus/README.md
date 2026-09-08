# Nexus

## Overview

### Available Operations

* [list](#list) - Get nexus for org

## list

Get a list of all nexuses for the organization.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get_nexus_for_org_v1_nexus_get" method="get" path="/v1/nexus" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
  api_key_header: '<YOUR_API_KEY_HERE>'
)

req = Models::Ops::GetNexusForOrgV1NexusGetRequest.new(
  status_in: 'APPROACHING,NOT_EXPOSED,PENDING_REGISTRATION,EXPOSED,APPROACHING,REGISTERED',
  order_by: 'state_code,country_code',
  x_organization_id: 'org_12345'
)
res = s.nexus.list(request: req)

unless res.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                  | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                  | [Models::Ops::GetNexusForOrgV1NexusGetRequest](../../models/operations/getnexusfororgv1nexusgetrequest.md) | :heavy_check_mark:                                                                                         | The request object to use for the request.                                                                 |

### Response

**[T.nilable(T.any(Models::Shared::PageNexusResponse, T::Array[Models::Shared::NexusResponse]))](../../models/operations/getnexusfororgv1nexusgetresponsegetnexusfororgv1nexusget.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |