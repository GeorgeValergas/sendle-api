module Sendle
  module Api
    module Factories
      class Errors

        def self.new_error(rest_client_error)
          response = JSON.parse(rest_client_error.response)
          error_text = response['error_description']
          messages = response['messages']

          case rest_client_error
          when RestClient::Unauthorized
            Sendle::Api::Errors::Unauthorized.new(error_text)
          when RestClient::PaymentRequired
            Sendle::Api::Errors::PaymentRequired.new(error_text)
          when RestClient::UnprocessableEntity
            Sendle::Api::Errors::UnprocessableEntity.new(messages)
          when  RestClient::PreconditionFailed
            Sendle::Api::Errors::PreconditionFailed.new(error_text)
          end
        end

      end
    end
  end
end