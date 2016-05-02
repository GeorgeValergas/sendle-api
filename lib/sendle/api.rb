# 3rd party libs
require 'rest-client'

# Version
require "sendle/api/version"

# Constants
require "sendle/api/constants"

# Utils
require 'sendle/api/utils'

# Syntax Sugar
require 'sendle/api/sugars/index'
require 'sendle/api/sugars/create'
require 'sendle/api/sugars/show'
require 'sendle/api/sugars/destroy'

# Api resource actions
require 'sendle/api/actions/base'
require 'sendle/api/actions/index'
require 'sendle/api/actions/create'
require 'sendle/api/actions/show'
require 'sendle/api/actions/destroy'

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
require 'sendle/api/errors/precondition_failed'

# Api responses
require 'sendle/api/responses/pong'
require 'sendle/api/responses/json'

# Api resources
require 'sendle/api/resource'
require 'sendle/api/ping'
require 'sendle/api/quote'
require 'sendle/api/order'

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
