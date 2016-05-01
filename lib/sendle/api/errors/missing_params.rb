module Sendle
  module Api
    module Errors
      class MissingParams < StandardError
        def initialize(*params)
          @missing_params = params
        end

        def to_s
          "The following params are required: #{@missing_params.join(', ')}. Please check your request and try again."
        end

      end
    end
  end
end