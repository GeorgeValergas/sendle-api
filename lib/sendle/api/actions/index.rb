module Sendle
  module Api
    module Actions
      module Index
        
        def index(params = {})
          Sendle::Api::Utils::Actions.check_for_missing_credentials if self.include_credentials?
          check_required_params(params)

          RestClient::Request.execute(rest_client_params)
          
          Sendle::Api::Responses::Pong.new
        rescue RestClient::Unauthorized, RestClient::PaymentRequired => e 
          raise Sendle::Api::Factories::Errors.new_error(e)
        end

        def rest_client_params
          rc_params = self.include_credentials? ? 
                               Sendle::Api::Utils::Actions.common_params_with_credentials :
                               Sendle::Api::Utils::Actions.common_params
          rc_params.merge(url: self.url)
        end

        def check_required_params(params)
          required = self.respond_to?(:required_params) ? self.required_params : []
          return if required.empty?

          Sendle::Api::Utils::Common.symbolize_strings(required).each do |required_param|
            if (!params.key?(required_param) || Sendle::Api::Utils::Common.nullish?(params[required_param]))
              raise Sendle::Api::Errors::MissingParams.new(required)
            end
          end

        end

      end
    end
  end
end