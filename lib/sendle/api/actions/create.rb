module Sendle
  module Api
    module Actions
      module Create

        def create(params = {})
          check_for_missing_credentials
          validate_create_request!(params)

          request_params = rest_client_params
          request_params[:method] = :post
          request_params[:url] = url
          request_params[:payload] = params 

          process_create_response(request(request_params))
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Create)
        end

        protected

          def http_method
            :post
          end

      end
    end
  end
end