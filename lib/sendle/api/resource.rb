class Sendle::Api::Resource

  def url
    raise "An API Resource must implement the url method."
  end

  def include_credentials?
    true
  end

  def process_response(response)
    Sendle::Api::Responses::Json.new(response)
  end

  def validate_request(params)
  end

end