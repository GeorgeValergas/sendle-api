module Sendle
  module Api
    module Actions
      module Index
        
        def index
          Sendle::Api::Utils::Actions.check_for_missing_credentials if self.include_credentials?

          rest_client_params = self.include_credentials? ? 
                               Sendle::Api::Utils::Actions.common_params_with_credentials :
                               Sendle::Api::Utils::Actions.common_params
          rest_client_params.merge!(url: self.url)    
          RestClient::Request.execute(rest_client_params)

          Sendle::Api::Responses::Pong.new
        rescue RestClient::Unauthorized, RestClient::PaymentRequired => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end

      end
    end
  end
end