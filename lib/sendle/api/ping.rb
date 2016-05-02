class Sendle::Api::Ping < Sendle::Api::Resource
  include Sendle::Api::Actions::Index

  class << self
    alias_method :execute, :index
  end

  def url
    Sendle::Api.base_url + "ping"
  end

  def process_response(response)
    Sendle::Api::Responses::Pong.new
  end

end