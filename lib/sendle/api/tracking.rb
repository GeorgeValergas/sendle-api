class Sendle::Api::Tracking < Sendle::Api::Resource
  include Sendle::Api::Actions::Show

  class << self
    alias_method :execute, :show
  end

  def url
    Sendle::Api.base_url + "tracking"
  end

  # def include_credentials?
  #   false
  # end

  # def validate_index_request!(params)
  #   # Checking for required params
  #   required = %w( pickup_suburb pickup_postcode delivery_suburb delivery_postcode kilogram_weight)
  #   validate_presence_of!(required, params)

  #   # Checking for valid plan_name, if passed in
  #   if params[:plan_name]
  #     plan_name = params[:plan_name]
  #     raise Sendle::Api::Errors::InvalidPlan.new(plan_name) unless Sendle::Api::PLANS.include?(plan_name)
  #   end
  # end

end