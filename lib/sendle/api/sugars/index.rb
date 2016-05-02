module Sendle
  module Api
    module Sugars
      module Index
        
        def index(params = {})
          self.new.index(params)
        end

        def url
          self.new.url
        end

      end
    end
  end
end