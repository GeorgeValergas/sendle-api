class Sendle::Api::Order < Sendle::Api::Resource
  include Sendle::Api::Actions::Create

  def url
    Sendle::Api.base_url + "orders"
  end

  def validate_create_request(params)
    # Checking for required params
    required = %w( pickup_date kilogram_weight cubic_metre_volume )
    Sendle::Api::Utils.symbolize_strings(required).each do |required_param|
      if (!params.key?(required_param) || Sendle::Api::Utils.nullish?(params[required_param]))
        raise Sendle::Api::Errors::MissingParams.new(required)
      end
    end

  end

end