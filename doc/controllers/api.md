# API

```ruby
client_controller = client.client
```

## Class Name

`APIController`

## Methods

* [Create O Auth Token](../../doc/controllers/api.md#create-o-auth-token)
* [Createanitem](../../doc/controllers/api.md#createanitem)
* [Getanitemby ID](../../doc/controllers/api.md#getanitemby-id)
* [Test Endpointwith Arrays](../../doc/controllers/api.md#test-endpointwith-arrays)


# Create O Auth Token

Generates a new OAuth token with the specified scopes.

```ruby
def create_o_auth_token(body: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`TokensRequest`](../../doc/models/tokens-request.md) | Body, Optional | - |

## Response Type

This method returns an [`ApiResponse`](../../doc/api-response.md) instance.

## Example Usage

```ruby
result = client_controller.create_o_auth_token
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Bad request | `APIException` |


# Createanitem

Creates a new resource in the system.

```ruby
def createanitem(status,
                 body: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `status` | [`Status3Enum`](../../doc/models/status-3-enum.md) | Template, Required | The status of the items to filter by. |
| `body` | [`Item`](../../doc/models/item.md) | Body, Optional | Custom model with additional properties |

## Response Type

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property in this instance returns the response data which is of type `Object`.

## Example Usage

```ruby
status = Status3Enum::ENUMVALUE3

body = Item.new(
  id: '550e8400-e29b-41d4-a716-446655440000',
  name: 'John Doe',
  date: Date.iso8601('2024-05-24'),
  date_time: DateTimeHelper.from_rfc3339('05/24/2024 12:00:00'),
  decimal: 1234.56,
  long: 1234567890123,
  bool: true,
  custom_enum: CustomEnum::VALUE3,
  json_object: { 'key1' => 'val1', 'key2' => 'val2' },
  animal: JSON.parse('{"key1":"val1","key2":"val2"}'),
  map: {
    'key0' => Message.new(
      code: 246,
      text: 'text4'
    ),
    'key1' => Message.new(
      code: 246,
      text: 'text4'
    )
  }
)

result = client_controller.createanitem(
  status,
  body: body
)
```

## Example Response

```
{
  "match": "client_mac",
  "name": "cameras",
  "type": "match",
  "values": [
    "010203040506",
    "abcdef*"
  ]
}
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Bad Syntax | `APIException` |
| 401 | Unauthorized | `APIException` |
| 403 | Permission Denied | `APIException` |


# Getanitemby ID

```ruby
def getanitemby_id(id,
                   value)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | The ID of the item to retrieve |
| `value` | `String` | Query, Required | The value of the item to retrieve |

## Response Type

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property in this instance returns the response data which is of type [`Item`](../../doc/models/item.md).

## Example Usage

```ruby
id = 'id0'

value = 'value2'

result = client_controller.getanitemby_id(
  id,
  value
)
```


# Test Endpointwith Arrays

This endpoint accepts a complex structure with multiple arrays.

```ruby
def test_endpointwith_arrays(body: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`MultipleArraysRequest`](../../doc/models/multiple-arrays-request.md) | Body, Optional | - |

## Response Type

This method returns an [`ApiResponse`](../../doc/api-response.md) instance.

## Example Usage

```ruby
result = client_controller.test_endpointwith_arrays
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Bad request | `APIException` |

