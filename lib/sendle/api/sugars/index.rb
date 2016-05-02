module Sendle
  module Api
    module Sugars
      module Index
        
        def index(params = {})
          self.new.index(params)
        end

      end
    end
  end
end