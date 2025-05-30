
# Getting Started with Cypress Test API

## Introduction

This is a sample API to demonstrate an OpenAPI spec with multiple endpoints and a custom model.

## Install the Package

Install the gem from the command line:

```bash
gem install test-sdk -v 2.1.8
```

Or add the gem to your Gemfile and run `bundle`:

```ruby
gem 'test-sdk', '2.1.8'
```

For additional gem details, see the [RubyGems page for the test-sdk gem](https://rubygems.org/gems/test-sdk/versions/2.1.8).

## Test the SDK

To run the tests, navigate to the root directory of the SDK in your terminal and execute the following command:

```
rake
```

## Initialize the API Client

**_Note:_** Documentation for the client can be found [here.](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/client.md)

The following parameters are configurable for the API Client:

| Parameter | Type | Description |
|  --- | --- | --- |
| connection | `Faraday::Connection` | The Faraday connection object passed by the SDK user for making requests |
| adapter | `Faraday::Adapter` | The Faraday adapter object passed by the SDK user for performing http requests |
| timeout | `Float` | The value to use for connection timeout. <br> **Default: 60** |
| max_retries | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| retry_interval | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| backoff_factor | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 2** |
| retry_statuses | `Array` | A list of HTTP statuses to retry. <br> **Default: [413, 503, 504]** |
| retry_methods | `Array` | A list of HTTP methods to retry. <br> **Default: %i[get put post]** |
| http_callback | `HttpCallBack` | The Http CallBack allows defining callables for pre and post API calls. |
| logging_configuration | [`LoggingConfiguration`](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/logging-configuration.md) | The SDK logging configuration for API calls |

The API client can be initialized as follows:

```ruby
client = CypressTestApi::Client.new(
  logging_configuration: LoggingConfiguration.new(
    log_level: Logger::INFO,
    request_logging_config: RequestLoggingConfiguration.new(
      log_body: true
    ),
    response_logging_config: ResponseLoggingConfiguration.new(
      log_headers: true
    )
  )
)
```

## List of APIs

* [API](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/controllers/api.md)

## SDK Infrastructure

### Configuration

* [AbstractLogger](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/abstract-logger.md)
* [LoggingConfiguration](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/logging-configuration.md)
* [RequestLoggingConfiguration](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/request-logging-configuration.md)
* [ResponseLoggingConfiguration](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/response-logging-configuration.md)

### HTTP

* [HttpResponse](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/http-response.md)
* [HttpRequest](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/http-request.md)

### Utilities

* [ApiResponse](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/api-response.md)
* [ApiHelper](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/api-helper.md)
* [DateTimeHelper](https://www.github.com/tahaali2000/test-ruby-sdk/tree/2.1.8/doc/date-time-helper.md)

