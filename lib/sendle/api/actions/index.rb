module Sendle
  module Api
    module Actions
      module Index

        def index(params = {})
          check_for_missing_credentials if include_credentials?
          validate_index_request!(params) 
          process_index_response(request(params))
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Index)
        end

      end
    end
  end
end