module Sendle
  module Api
    module Actions
      module Index
        
        def index
          Sendle::Api::Utils::Actions.check_for_missing_credentials
          RestClient::Request.execute(
            method: :get,
            url: self.url,
            user: Sendle::Api.sendle_id,
            password: Sendle::Api.api_key,
            headers: Sendle::Api::Utils::Actions.json_headers
          )
          Sendle::Api::Responses::Pong.new
        rescue RestClient::Unauthorized, RestClient::PaymentRequired => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end
      end
    end
  end
end