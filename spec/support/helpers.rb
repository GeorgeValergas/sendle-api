require 'rest-client'

def json_headers
  { headers: { accept: :json, content_type: :json } }
end

UNAUTHORIZED_ERROR = RestClient::Unauthorized.new("{\"error\":\"unauthorised\",\"error_description\":\"The authorisation details are not valid. Either the Sendle ID or API key are incorrect.\"}")