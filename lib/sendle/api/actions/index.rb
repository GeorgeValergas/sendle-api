require 'rest-client'

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
        rescue RestClient::Unauthorized => e 
          response = JSON.parse(e.response)
          raise Sendle::Api::Errors::Unauthorized.new(response['error_description'])
        end
      end
    end
  end
end