module Sendle
  module Api
    module Utils
      class Common

        class << self
          def symbolize_strings(array_string)
            array_string.map { |x| x.to_sym }
          end

          def nullish?(v)
            v.empty? || v.nil?
          end
        end

      end
    end
  end

end