# 3rd party libs
require 'rest-client'

# Version
require "sendle/api/version"

# Api resource actions
require 'sendle/api/actions/index'

# Api errors
require 'sendle/api/errors/missing_api_key'
require 'sendle/api/errors/missing_sendle_id'
require 'sendle/api/errors/missing_unauthorized'

# Api responses
require 'sendle/api/responses/pong'

# Utils
require 'sendle/utils/actions'

# Api resources
require 'sendle/api/ping'

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
