module Sendle
  module Api
    module Utils
      class Actions

        class << self
          def check_for_missing_credentials
            raise Sendle::Api::Errors::MissingSendleId if Sendle::Api.sendle_id.nil?
            raise Sendle::Api::Errors::MissingApiKey if Sendle::Api.api_key.nil?
          end

          def json_headers
            { accept: :json, content_type: :json }
          end

          def common_params
            {
              method: :get,
              headers: Sendle::Api::Utils::Actions.json_headers
            }
          end

          def credential_params
            {
              user: Sendle::Api.sendle_id,
              password: Sendle::Api.api_key
            }
          end

          def common_params_with_credentials
            common_params.merge(credential_params)
          end
        end

      end
    end
  end

end