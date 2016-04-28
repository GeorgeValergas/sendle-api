class Sendle::Api::Ping

  class << self
    def index
      raise Sendle::Api::Errors::MissingSendleId if Sendle::Api.sendle_id.nil?
      raise Sendle::Api::Errors::MissingApiKey if Sendle::Api.api_key.nil?
    end

  end

end