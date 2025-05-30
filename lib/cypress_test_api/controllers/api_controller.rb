# cypress_test_api
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module CypressTestApi
  # APIController
  class APIController < BaseController
    # Generates a new OAuth token with the specified scopes.
    # @param [TokensRequest] body Optional parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def create_o_auth_token(body: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/tokens',
                                     Server::DEFAULT)
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end))
        .response(new_response_handler
                    .is_response_void(true)
                    .is_api_response(true)
                    .local_error('400',
                                 'Bad request',
                                 APIException))
        .execute
    end

    # Creates a new resource in the system.
    # @param [Status3Enum] status Required parameter: The status of the items to
    # filter by.
    # @param [Item] body Optional parameter: Custom model with additional
    # properties
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def createanitem(status,
                     body: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/items/{status}',
                                     Server::DEFAULT)
                   .template_param(new_parameter(status, key: 'status')
                                    .is_required(true)
                                    .should_encode(true))
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .header_param(new_parameter('application/json', key: 'accept'))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:json_deserialize))
                    .is_api_response(true)
                    .local_error('400',
                                 'Bad Syntax',
                                 APIException)
                    .local_error('401',
                                 'Unauthorized',
                                 APIException)
                    .local_error('403',
                                 'Permission Denied',
                                 APIException))
        .execute
    end

    # TODO: type endpoint description here
    # @param [String] id Required parameter: The ID of the item to retrieve
    # @param [String] value Required parameter: The value of the item to
    # retrieve
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def getanitemby_id(id,
                       value)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::GET,
                                     '/items/{id}',
                                     Server::DEFAULT)
                   .template_param(new_parameter(id, key: 'id')
                                    .is_required(true)
                                    .should_encode(true))
                   .query_param(new_parameter(value, key: 'value')
                                 .is_required(true))
                   .header_param(new_parameter('application/json', key: 'accept')))
        .response(new_response_handler
                    .deserializer(APIHelper.method(:custom_type_deserializer))
                    .deserialize_into(Item.method(:from_hash))
                    .is_api_response(true))
        .execute
    end

    # This endpoint accepts a complex structure with multiple arrays.
    # @param [MultipleArraysRequest] body Optional parameter: Example:
    # @return [ApiResponse]  the complete http response with raw body and status code.
    def test_endpointwith_arrays(body: nil)
      new_api_call_builder
        .request(new_request_builder(HttpMethodEnum::POST,
                                     '/multiple-arrays',
                                     Server::DEFAULT)
                   .header_param(new_parameter('application/json', key: 'Content-Type'))
                   .body_param(new_parameter(body))
                   .body_serializer(proc do |param| param.to_json unless param.nil? end))
        .response(new_response_handler
                    .is_response_void(true)
                    .is_api_response(true)
                    .local_error('400',
                                 'Bad request',
                                 APIException))
        .execute
    end
  end
end
