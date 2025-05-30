# cypress_test_api
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module CypressTestApi
  #  cypress_test_api client class.
  class Client
    include CoreLibrary
    attr_reader :config

    # Access to client controller.
    # @return [APIController] Returns the controller instance.
    def client
      @client ||= APIController.new @global_configuration
    end

    def initialize(connection: nil, adapter: :net_http_persistent, timeout: 60,
                   max_retries: 0, retry_interval: 1, backoff_factor: 2,
                   retry_statuses: [413, 503, 504],
                   retry_methods: %i[get put post], http_callback: nil,
                   logging_configuration: nil,
                   environment: Environment::PRODUCTION, config: nil)
      @config = if config.nil?
                  Configuration.new(
                    connection: connection, adapter: adapter, timeout: timeout,
                    max_retries: max_retries, retry_interval: retry_interval,
                    backoff_factor: backoff_factor,
                    retry_statuses: retry_statuses,
                    retry_methods: retry_methods, http_callback: http_callback,
                    logging_configuration: logging_configuration,
                    environment: environment
                  )
                else
                  config
                end
      user_agent_params = BaseController.user_agent_parameters

      @global_configuration = GlobalConfiguration.new(client_configuration: @config)
                                                 .base_uri_executor(@config.method(:get_base_uri))
                                                 .global_errors(BaseController::GLOBAL_ERRORS)
                                                 .user_agent(BaseController.user_agent,
                                                             agent_parameters: user_agent_params)
    end
  end
end
