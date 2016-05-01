module Sendle
  module Api
    module Errors
      class UnprocessableEntity < StandardError

        def initialize(messages)
          @messages = messages
        end

        def to_s
          msg = "Please fix the following errors and try again - "
          @messages.each { |k, v| msg += "#{k}: #{v.join(', ')}" }
          msg
        end

      end
    end
  end
end