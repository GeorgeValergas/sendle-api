module Sendle
  module Api
    module Actions
      module Index
        
        def index(params = {})
          Sendle::Api::Utils::Actions.check_for_missing_credentials if self.include_credentials?
          self.validate_request(params) if self.respond_to?(:validate_request)

          response = RestClient::Request.execute(rest_client_params(params))
          self.process_response(response)
        rescue RestClient::Unauthorized, RestClient::PaymentRequired, RestClient::UnprocessableEntity => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end

        private

          def rest_client_params(params)
            rc_params = self.include_credentials? ? common_params_with_credentials(params) : common_params(params)
            rc_params.merge(url: self.url)
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