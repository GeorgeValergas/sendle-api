module Sendle
  module Api
    module Actions
      module Base

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