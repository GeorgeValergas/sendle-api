module Sendle
  module Api
    module Actions
      module Create

        def create(params = {})
          check_for_missing_credentials
          validate_create_request!(params)
          request(params)
        rescue RestClient::PreconditionFailed => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
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