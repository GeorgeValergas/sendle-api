module Sendle
  module Api
    module Actions
      module Create

        def create(params = {})
          check_for_missing_credentials
          validate_create_request!(params)
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Create)
        end

      end
    end
  end
end