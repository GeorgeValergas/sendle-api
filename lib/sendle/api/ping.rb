class Sendle::Api::Ping
  extend Sendle::Api::Actions::Index

  class << self
    alias_method :execute, :index
  end

  def self.url
    Sendle::Api.base_url + "ping"
  end
end