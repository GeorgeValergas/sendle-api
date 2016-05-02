class Sendle::Api::Resource
  include Sendle::Api::Actions::Base

  def url
    raise "An API Resource must implement the url method."
  end

  def self.url
    self.new.url
  end

  def include_credentials?
    true
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

  def method_missing(m, *args, &blk)
    if Sendle::Api::Utils.respond_to?(m)
      Sendle::Api::Utils.send(m, *args)
    else
      super(m, *args, blk)
    end
  end

end