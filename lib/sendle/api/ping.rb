class Sendle::Api::Ping
  extend Sendle::Api::Actions::Index

  class << self
    alias_method :execute, :index

    def url
      Sendle::Api.base_url + "ping"
    end

    def include_credentials?
      true
    end

    def process_response(response)
      Sendle::Api::Responses::Pong.new
    end
  end

end