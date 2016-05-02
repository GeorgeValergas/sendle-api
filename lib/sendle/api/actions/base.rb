module Sendle
  module Api
    module Actions
      module Base

        def request(params)
          RestClient::Request.execute(rest_client_params(params))
        end

        protected

          #Hook method
          def http_method
            :get
          end

        private 

          def rest_client_params(params)
            rc_params = include_credentials? ? common_params_with_credentials(params) : common_params(params)
            rc_params.merge(url: url)
          end

          def common_params(params)
            headers = json_headers
            headers.merge!(params: params) unless params.empty?
            {
              method: http_method,
              headers: headers
            }
          end

          def common_params_with_credentials(params)
            common_params(params).merge(credential_params)
          end

          def check_for_missing_credentials
            return unless self.include_credentials?
            raise Sendle::Api::Errors::MissingSendleId if Sendle::Api.sendle_id.nil?
            raise Sendle::Api::Errors::MissingApiKey if Sendle::Api.api_key.nil?
          end

          def json_headers
            { accept: :json, content_type: :json }
          end

          def credential_params
            {
              user: Sendle::Api.sendle_id,
              password: Sendle::Api.api_key
            }
          end

      end
    end
  end
end