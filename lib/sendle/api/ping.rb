class Sendle::Api::Ping
  extend Sendle::Api::Actions::Index

  def self.url
    Sendle::Api.base_url + "ping"
  end
end