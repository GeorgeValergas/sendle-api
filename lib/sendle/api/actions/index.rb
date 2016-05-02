module Sendle
  module Api
    module Actions
      module Index

        def index(params = {})
          check_for_missing_credentials if include_credentials?
          validate_index_request(params) 
          process_index_response(request(params))
        rescue RestClient::Unauthorized, RestClient::PaymentRequired, RestClient::UnprocessableEntity => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Index)
        end

      end
    end
  end
end