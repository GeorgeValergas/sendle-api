class Sendle::Api::Quote
  extend Sendle::Api::Actions::Index

  class << self
    alias_method :execute, :index

    def url
      Sendle::Api.base_url + "quote"
    end

    def include_credentials?
      false
    end

    def required_params
      %w( pickup_suburb pickup_postcode delivery_suburb delivery_postcode kilogram_weight)
    end

    def process_response(response)
      Sendle::Api::Responses::Json.new(response)
    end
  end

end