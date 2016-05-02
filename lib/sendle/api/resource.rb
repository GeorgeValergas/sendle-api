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
  def validate_index_request!(params)
  end

  def process_index_response(response)
    return_json(response)
  end

  #Create action hook methods
  def validate_create_request!(params)
  end

  def process_create_response(response)
    return_json(response)
  end

  #Show action hook methods
  def process_show_response(response)
    return_json(response)
  end

  def method_missing(m, *args, &blk)
    if Sendle::Api::Utils.respond_to?(m)
      Sendle::Api::Utils.send(m, *args)
    else
      super(m, *args, blk)
    end
  end

  protected

    def return_json(response)
      Sendle::Api::Responses::Json.new(response)
    end

    def validate_presence_of!(required_params, hash)
      symbolize_strings(required_params).each do |required_param|
        if (!hash.key?(required_param) || nullish?(hash[required_param]))
          raise Sendle::Api::Errors::MissingParams.new(required_params)
        end
      end
    end

end