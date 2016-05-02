class Sendle::Api::Order < Sendle::Api::Resource
  include Sendle::Api::Actions::Create

  def url
    Sendle::Api.base_url + "orders"
  end


end