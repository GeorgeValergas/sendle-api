# 3rd party libs
require 'rest-client'

# Version
require "sendle/api/version"

# Api resource actions
require 'sendle/api/actions/index'

# Factories
require 'sendle/api/factories/errors'

# Api errors
require 'sendle/api/errors/missing_api_key'
require 'sendle/api/errors/missing_sendle_id'
require 'sendle/api/errors/unauthorized'
require 'sendle/api/errors/payment_required'

# Api responses
require 'sendle/api/responses/pong'

# Utils
require 'sendle/utils/actions'

# Api resources
require 'sendle/api/ping'

module Sendle
  module Api
    @sandbox = false

    class << self
      attr_accessor :api_key, :sendle_id, :sandbox

      def base_url
        sandbox ? "https://sandbox.sendle.com/api/" : "https://www.sendle.com/api/"
      end
    end
    
  end
end
