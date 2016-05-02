module Sendle
  module Api
    class Utils

      class << self

        def symbolize_strings(array_string)
          array_string.map { |x| x.to_sym }
        end

        def nullish?(v)
          v.nil? || v.to_s.empty?
        end

        def hash_contains?(hash, key)
          hash.key?(key) && !hash[key].nil?
        end

      end

    end
  end

end