class Sendle::Api::Ping < Sendle::Api::Resource
  include Sendle::Api::Actions::Index

  class << self
    def index(params = {})
      self.new.index(params)
    end

    def url
      self.new.url
    end

    alias_method :execute, :index
  end

  def url
    Sendle::Api.base_url + "ping"
  end

  def process_response(response)
    Sendle::Api::Responses::Pong.new
  end

end