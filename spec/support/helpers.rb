require 'rest-client'

def json_headers
  { headers: { accept: :json, content_type: :json } }
end

UNAUTHORIZED_ERROR = RestClient::Unauthorized.new("{\"error\":\"unauthorised\",\"error_description\":\"The authorisation details are not valid. Either the Sendle ID or API key are incorrect.\"}")

PAYMENT_REQUIRED_ERROR = RestClient::PaymentRequired.new("{\"error\":\"payment_required\",\"error_description\":\"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method.\"}")