module Sendle
  module Api
    module Responses
      class Json
        attr_reader :raw, :json

        def initialize(json_string)
          @raw = json_string
          @json = JSON.parse(json_string)
        end

      end
    end
  end
end