module Sendle
  module Api
    module Actions
      module Base

        def request(params)
          RestClient::Request.execute(params)
        rescue RestClient::PreconditionFailed, 
               RestClient::Unauthorized, 
               RestClient::PaymentRequired, 
               RestClient::UnprocessableEntity => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end

        protected 

          def rest_client_params
            include_credentials? ? common_params_with_credentials : common_params
          end

          def common_params
            {
              headers: json_headers
            }
          end

          def common_params_with_credentials
            common_params.merge(credential_params)
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