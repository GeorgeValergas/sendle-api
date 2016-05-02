module Sendle
  module Api
    module Sugars
      module Create
        
        def create(params = {})
          self.new.create(params)
        end

      end
    end
  end
end