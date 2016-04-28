require "spec_helper"

describe Sendle::Api::Ping do

  describe "#index" do
    it_behaves_like "a resource action with credentials"
  end

end
