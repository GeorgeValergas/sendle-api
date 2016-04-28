require 'rest-client'

require "sendle/api/version"

module Sendle
  module Api

    class << self
      attr_accessor :api_key, :sendle_id

      def base_url
        "https://sandbox.sendle.com/api/"
      end
    end
    
  end
end
