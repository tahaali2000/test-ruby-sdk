
# Getting Started with PayPal REST APIs

## Introduction

An order represents a payment between two or more parties. Use the Orders API to create, update, retrieve, authorize, and capture orders., Call the Payments API to authorize payments, capture authorized payments, refund payments that have already been captured, and show payment information. Use the Payments API in conjunction with the <a href="/docs/api/orders/v2/">Orders API</a>. For more information, see the <a href="/docs/checkout/">PayPal Checkout Overview</a>., The Payment Method Tokens API saves payment methods so payers don't have to enter details for future transactions. Payers can check out faster or pay without being present after they agree to save a payment method.<br><br>The API associates a payment method with a temporary setup token. Pass the setup token to the API to exchange the setup token for a permanent token.<br><br>The permanent token represents a payment method that's saved to the vault. This token can be used repeatedly for checkout or recurring transactions such as subscriptions.<br><br>The Payment Method Tokens API is available in the US only.

Find out more here: [https://developer.paypal.com/docs/api/orders/v2/](https://developer.paypal.com/docs/api/orders/v2/)

## Install the Package

Install the gem from the command line:

```bash
gem install test-sdk -v 1.2.6
```

Or add the gem to your Gemfile and run `bundle`:

```ruby
gem 'test-sdk', '1.2.6'
```

For additional gem details, see the [RubyGems page for the test-sdk gem](https://rubygems.org/gems/test-sdk/versions/1.2.6).

## Initialize the API Client

**_Note:_** Documentation for the client can be found [here.](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/client.md)

The following parameters are configurable for the API Client:

| Parameter | Type | Description |
|  --- | --- | --- |
| environment | `Environment` | The API environment. <br> **Default: `Environment.SANDBOX`** |
| connection | `Faraday::Connection` | The Faraday connection object passed by the SDK user for making requests |
| adapter | `Faraday::Adapter` | The Faraday adapter object passed by the SDK user for performing http requests |
| timeout | `Float` | The value to use for connection timeout. <br> **Default: 60** |
| max_retries | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| retry_interval | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| backoff_factor | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 2** |
| retry_statuses | `Array` | A list of HTTP statuses to retry. <br> **Default: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524, 408, 413, 429, 500, 502, 503, 504, 521, 522, 524]** |
| retry_methods | `Array` | A list of HTTP methods to retry. <br> **Default: %i[get put get put]** |
| http_callback | `HttpCallBack` | The Http CallBack allows defining callables for pre and post API calls. |
| logging_configuration | [`LoggingConfiguration`](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/logging-configuration.md) | The SDK logging configuration for API calls |
| client_credentials_auth_credentials | [`ClientCredentialsAuthCredentials`](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/auth/oauth-2-client-credentials-grant.md) | The credential object for OAuth 2 Client Credentials Grant |

The API client can be initialized as follows:

```ruby
client = PayPalRestapIs::Client.new(
  client_credentials_auth_credentials: ClientCredentialsAuthCredentials.new(
    o_auth_client_id: 'OAuthClientId',
    o_auth_client_secret: 'OAuthClientSecret'
  ),
  environment: Environment::SANDBOX,
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

## Environments

The SDK can be configured to use a different environment for making API calls. Available environments are:

### Fields

| Name | Description |
|  --- | --- |
| Production | PayPal Live Environment |
| Sandbox | **Default** PayPal Sandbox Environment |

## Authorization

This API uses the following authentication schemes.

* [`Oauth2 (OAuth 2 Client Credentials Grant)`](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/auth/oauth-2-client-credentials-grant.md)

## List of APIs

* [Orders](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/controllers/orders.md)
* [Payments](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/controllers/payments.md)
* [Vault](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/controllers/vault.md)

## SDK Infrastructure

### Configuration

* [AbstractLogger](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/abstract-logger.md)
* [LoggingConfiguration](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/logging-configuration.md)
* [RequestLoggingConfiguration](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/request-logging-configuration.md)
* [ResponseLoggingConfiguration](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/response-logging-configuration.md)

### HTTP

* [HttpResponse](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/http-response.md)
* [HttpRequest](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/http-request.md)

### Utilities

* [ApiHelper](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/api-helper.md)
* [DateTimeHelper](https://www.github.com/tahaali2000/test-ruby-sdk/tree/1.2.6/doc/date-time-helper.md)

