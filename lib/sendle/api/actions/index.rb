module Sendle
  module Api
    module Actions
      module Index
        
        def index
          Sendle::Api::Utils::Actions.check_for_missing_credentials
        end

      end
    end
  end
end