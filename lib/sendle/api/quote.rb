class Sendle::Api::Quote
  extend Sendle::Api::Actions::Index

  class << self
    alias_method :execute, :index
  end

  def self.url
    Sendle::Api.base_url + "quote"
  end

  def self.include_credentials?
    false
  end
end