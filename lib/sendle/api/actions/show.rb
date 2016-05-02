module Sendle
  module Api
    module Actions
      module Show

        def show(id)
          raise Sendle::Api::Errors::MissingParams.new(['id']) if nullish?(id) 
        end

        def self.included(base)
          base.extend(Sendle::Api::Sugars::Show)
        end

      end
    end
  end
end