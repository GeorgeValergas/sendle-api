class Sendle::Api::Resource

  def url
    raise "An API Resource must implement the url method."
  end

  def self.url
    self.new.url
  end

  def include_credentials?
    true
  end

  def check_for_missing_credentials
    return unless self.include_credentials?
    raise Sendle::Api::Errors::MissingSendleId if Sendle::Api.sendle_id.nil?
    raise Sendle::Api::Errors::MissingApiKey if Sendle::Api.api_key.nil?
  end

  def json_headers
    { accept: :json, content_type: :json }
  end

  def credential_params
    {
      user: Sendle::Api.sendle_id,
      password: Sendle::Api.api_key
    }
  end

  #Index action hook methods
  def validate_index_request(params)
  end

  def process_index_response(response)
    Sendle::Api::Responses::Json.new(response)
  end

  #Create action hook methods
  def validate_create_request(params)
  end

end