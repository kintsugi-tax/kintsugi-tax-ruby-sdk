# Nexus
(*nexus*)

## Overview

### Available Operations

* [list](#list) - Get Nexus For Org

## list

Get a list of all nexuses for the organization.

### Example Usage

```ruby
require 'openapi'

Models = ::OpenApiSDK::Models
s = ::OpenApiSDK::SDK.new

req = Models::Operations::GetNexusForOrgV1NexusGetRequest.new(
  x_organization_id: 'org_12345',
)

res = s.nexus.list(request: req, security: Models::Operations::GetNexusForOrgV1NexusGetSecurity.new(
    api_key_header: '<YOUR_API_KEY_HERE>',
  ))

unless res.page_nexus_response.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                           | Type                                                                                                                | Required                                                                                                            | Description                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `request`                                                                                                           | [Models::Operations::GetNexusForOrgV1NexusGetRequest](../../models/operations/getnexusfororgv1nexusgetrequest.md)   | :heavy_check_mark:                                                                                                  | The request object to use for the request.                                                                          |
| `security`                                                                                                          | [Models::Operations::GetNexusForOrgV1NexusGetSecurity](../../models/operations/getnexusfororgv1nexusgetsecurity.md) | :heavy_check_mark:                                                                                                  | The security requirements to use for the request.                                                                   |

### Response

**[T.nilable(Models::Operations::GetNexusForOrgV1NexusGetResponse)](../../models/operations/getnexusfororgv1nexusgetresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::HTTPValidationError | 422                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |