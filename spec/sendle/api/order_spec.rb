require "spec_helper"

describe Sendle::Api::Order do

  let(:api_key) { 'fake-key' }
  let(:sendle_id) { 'fake-id' }

  before do
    Sendle::Api.api_key = api_key
    Sendle::Api.sendle_id = sendle_id
  end

  describe "#create" do
    it_behaves_like "a resource action with credentials"

  end

end
