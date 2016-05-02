require 'rest-client'

def json_headers
  { headers: { accept: :json, content_type: :json } }
end

UNAUTHORIZED_ERROR = RestClient::Unauthorized.new("{\"error\":\"unauthorised\",\"error_description\":\"The authorisation details are not valid. Either the Sendle ID or API key are incorrect.\"}")

PAYMENT_REQUIRED_ERROR = RestClient::PaymentRequired.new("{\"error\":\"payment_required\",\"error_description\":\"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method.\"}")

UNPROCESSABLE_ENTITY_ERROR = RestClient::UnprocessableEntity.new("{\"messages\":{\"kilogram_weight\":[\"is not a number\"]},\"error\":\"unprocessable_entity\",\"error_description\":\"The data you supplied is invalid. Error messages are in the messages section. Please fix those fields and try again.\"}")

PRECONDITION_FAILED_ERROR = RestClient::PreconditionFailed.new("{\"error\":\"precondition_failed\",\"error_description\":\"The account associated with this API key has not accepted the dangerous goods terms. Please visit your Account Settings in https://www.sendle.com/dashboard/ to view and accept these terms.\"}")

QUOTE_NO_PLAN_RESPONSE = "[{\"quote\":{\"gross\":{\"amount\":9.75,\"currency\":\"AUD\"},\"net\":{\"amount\":8.86,\"currency\":\"AUD\"},\"tax\":{\"amount\":0.89,\"currency\":\"AUD\"}},\"plan_name\":\"Easy\"},{\"quote\":{\"gross\":{\"amount\":8.75,\"currency\":\"AUD\"},\"net\":{\"amount\":7.95,\"currency\":\"AUD\"},\"tax\":{\"amount\":0.8,\"currency\":\"AUD\"}},\"plan_name\":\"Premium\"},{\"quote\":{\"gross\":{\"amount\":5.98,\"currency\":\"AUD\"},\"net\":{\"amount\":5.44,\"currency\":\"AUD\"},\"tax\":{\"amount\":0.54,\"currency\":\"AUD\"}},\"plan_name\":\"Pro\"}]"