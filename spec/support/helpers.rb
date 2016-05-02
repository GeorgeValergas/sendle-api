require 'rest-client'

def json_headers
  { headers: { accept: :json, content_type: :json } }
end

UNAUTHORIZED_ERROR = RestClient::Unauthorized.new("{\"error\":\"unauthorised\",\"error_description\":\"The authorisation details are not valid. Either the Sendle ID or API key are incorrect.\"}")

PAYMENT_REQUIRED_ERROR = RestClient::PaymentRequired.new("{\"error\":\"payment_required\",\"error_description\":\"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method.\"}")

UNPROCESSABLE_ENTITY_ERROR = RestClient::UnprocessableEntity.new("{\"messages\":{\"kilogram_weight\":[\"is not a number\"]},\"error\":\"unprocessable_entity\",\"error_description\":\"The data you supplied is invalid. Error messages are in the messages section. Please fix those fields and try again.\"}")

PRECONDITION_FAILED_ERROR = RestClient::PreconditionFailed.new("{\"error\":\"precondition_failed\",\"error_description\":\"The account associated with this API key has not accepted the dangerous goods terms. Please visit your Account Settings in https://www.sendle.com/dashboard/ to view and accept these terms.\"}")

QUOTE_NO_PLAN_RESPONSE = "[{\"quote\":{\"gross\":{\"amount\":9.75,\"currency\":\"AUD\"},\"net\":{\"amount\":8.86,\"currency\":\"AUD\"},\"tax\":{\"amount\":0.89,\"currency\":\"AUD\"}},\"plan_name\":\"Easy\"},{\"quote\":{\"gross\":{\"amount\":8.75,\"currency\":\"AUD\"},\"net\":{\"amount\":7.95,\"currency\":\"AUD\"},\"tax\":{\"amount\":0.8,\"currency\":\"AUD\"}},\"plan_name\":\"Premium\"},{\"quote\":{\"gross\":{\"amount\":5.98,\"currency\":\"AUD\"},\"net\":{\"amount\":5.44,\"currency\":\"AUD\"},\"tax\":{\"amount\":0.54,\"currency\":\"AUD\"}},\"plan_name\":\"Pro\"}]"

ORDER_CREATED_RESPONSE = "{\"order_id\":\"9dbadcd6-ee57-488e-a175-49e378ad29ff\",\"state\":\"Pickup\",\"order_url\":\"https://sendle-sandbox.herokuapp.com/api/orders/9dbadcd6-ee57-488e-a175-49e378ad29ff\",\"labels\":null,\"scheduling\":{\"is_cancellable\":true,\"pickup_date\":\"2016-05-05\"},\"description\":\"Kryptonite\",\"confirmed_not_dangerous\":false,\"kilogram_weight\":\"1.0\",\"cubic_metre_volume\":\"0.01\",\"customer_reference\":\"SupBdayPressie\",\"sender\":{\"contact\":{\"name\":\"Lex Luthor\",\"phone\":\"0412 345 678\",\"email\":\"bobl53@gmail.com\",\"sendle_id\":\"bobl53_gmail_com\"},\"address\":{\"address_line1\":\"123 Gotham Ln\",\"address_line2\":null,\"suburb\":\"Sydney\",\"state_name\":\"NSW\",\"postcode\":\"2000\",\"country\":\"Australia\"},\"instructions\":\"Knock loudly\"},\"receiver\":{\"contact\":{\"name\":\"Clark Kent\",\"phone\":null,\"email\":\"clarkissuper@dailyplanet.xyz\"},\"address\":{\"address_line1\":\"80 Wentworth Park Road\",\"address_line2\":null,\"suburb\":\"Glebe\",\"state_name\":\"NSW\",\"postcode\":\"2037\",\"country\":\"Australia\"},\"instructions\":\"Give directly to Clark\"}}"