module Sendle
  module Api
    module Actions
      module Index

        def index(params = {})
          check_for_missing_credentials if include_credentials?
          validate_index_request(params) 

          response = RestClient::Request.execute(rest_client_params(params))
          process_index_response(response)
        rescue RestClient::Unauthorized, RestClient::PaymentRequired, RestClient::UnprocessableEntity => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Index)
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
              method: :get,
              headers: headers
            }
          end

          def common_params_with_credentials(params)
            common_params(params).merge(credential_params)
          end

      end
    end
  end
end