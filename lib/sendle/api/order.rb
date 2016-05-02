class Sendle::Api::Order < Sendle::Api::Resource
  include Sendle::Api::Actions::Create

  def url
    Sendle::Api.base_url + "orders"
  end

  def validate_create_request(params)
    # Checking for required params of parcel
    required = %w( pickup_date kilogram_weight cubic_metre_volume )
    validate_presence_of!(required, params)

    # Checking for sender params
    raise Sendle::Api::Errors::MissingParams.new(['sender']) unless hash_contains?(params, :sender) 
    sender_params = params[:sender]
    raise Sendle::Api::Errors::MissingParams.new(['sender:contact']) unless hash_contains?(sender_params, :contact) 
    required = %w( name phone )
    validate_presence_of!(required, sender_params[:contact])

  end

end