module Sendle
  module Api
    module Sugars
      module Destroy
        
        def destroy(id)
          self.new.destroy(id)
        end

      end
    end
  end
end