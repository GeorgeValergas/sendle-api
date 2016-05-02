module Sendle
  module Api
    module Actions
      module Create

        def create(params = {})
          Sendle::Api::Utils::Actions.check_for_missing_credentials if self.include_credentials?
          validate_create_request(params)
        end

        def self.included(other)
          other.extend(Sendle::Api::Sugars::Create)
        end

      end
    end
  end
end