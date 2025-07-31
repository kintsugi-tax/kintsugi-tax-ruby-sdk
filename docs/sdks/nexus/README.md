# Nexus
(*nexus*)

## Overview

### Available Operations

* [list](#list) - Get Nexus For Org

## list

Get a list of all nexuses for the organization.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="get_nexus_for_org_v1_nexus_get" method="get" path="/v1/nexus" -->
```ruby
require 'kintsugi_sdk'

Models = ::KintsugiSDK::Models
s = ::KintsugiSDK::OpenApiSDK.new(
      security: Models::Shared::Security.new(
        api_key_header: '<YOUR_API_KEY_HERE>',
        custom_header: '<YOUR_API_KEY_HERE>',
      ),
    )

req = Models::Ops::GetNexusForOrgV1NexusGetRequest.new()

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

**[T.nilable(Models::Shared::PageNexusResponse)](../../models/operations/pagenexusresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |