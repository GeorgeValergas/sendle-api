# 3rd party libs
require 'rest-client'

# Version
require "sendle/api/version"

# Constants
require "sendle/api/constants"

# Syntax Sugar
require 'sendle/api/sugars/index'

# Api resource actions
require 'sendle/api/actions/index'

# Factories
require 'sendle/api/factories/errors'

# Api errors
require 'sendle/api/errors/missing_api_key'
require 'sendle/api/errors/missing_sendle_id'
require 'sendle/api/errors/unauthorized'
require 'sendle/api/errors/payment_required'
require 'sendle/api/errors/missing_params'
require 'sendle/api/errors/invalid_plan'
require 'sendle/api/errors/unprocessable_entity'

# Api responses
require 'sendle/api/responses/pong'
require 'sendle/api/responses/json'

# Utils
require 'sendle/utils/common'
require 'sendle/utils/actions'

# Api resources
require 'sendle/api/resource'
require 'sendle/api/ping'
require 'sendle/api/quote'

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
