module Sendle
  module Api
    module Errors
      class InvalidPlan < StandardError
        def initialize(plan)
          @plan = plan
        end

        def to_s
          "#{@plan} is not in the list of valid plans: #{PLANS.join(', ')}"
        end

      end
    end
  end
end