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

    def validate_request(params)
      # Checking for required params
      required = self.respond_to?(:required_params) ? self.required_params : []
      return if required.empty?
      Sendle::Api::Utils::Common.symbolize_strings(required).each do |required_param|
        if (!params.key?(required_param) || Sendle::Api::Utils::Common.nullish?(params[required_param]))
          raise Sendle::Api::Errors::MissingParams.new(required)
        end
      end

      # Checking for valid plan_name, if passed in
      if params[:plan_name]
        plan_name = params[:plan_name]
        raise Sendle::Api::Errors::InvalidPlan.new(plan_name) unless PLANS.include?(plan_name)
      end
    end
  end

end