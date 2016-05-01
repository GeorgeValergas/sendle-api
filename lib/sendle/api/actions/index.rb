module Sendle
  module Api
    module Actions
      module Index
        
        def index(params = {})
          Sendle::Api::Utils::Actions.check_for_missing_credentials if self.include_credentials?
          check_required_params(params)

          response = RestClient::Request.execute(rest_client_params(params))
          self.process_response(response)
        rescue RestClient::Unauthorized, RestClient::PaymentRequired => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end

        def rest_client_params(params)
          rc_params = self.include_credentials? ? common_params_with_credentials(params) : common_params(params)
          rc_params.merge(url: self.url)
        end

        def check_required_params(params)
          required = self.respond_to?(:required_params) ? self.required_params : []
          return if required.empty?

          Sendle::Api::Utils::Common.symbolize_strings(required).each do |required_param|
            if (!params.key?(required_param) || Sendle::Api::Utils::Common.nullish?(params[required_param]))
              raise Sendle::Api::Errors::MissingParams.new(required)
            end
          end
        end

        def common_params(params)
          headers = Sendle::Api::Utils::Actions.json_headers
          headers.merge!(params: params) unless params.empty?
          {
            method: :get,
            headers: headers
          }
        end

        def common_params_with_credentials(params)
          common_params(params).merge(Sendle::Api::Utils::Actions.credential_params)
        end

      end
    end
  end
end