require "spec_helper"

describe Sendle::Api::Ping do

  let(:api_key) { 'fake-key' }
  let(:sendle_id) { 'fake-id' }

  before do
    Sendle::Api.api_key = api_key
    Sendle::Api.sendle_id = sendle_id
  end

  describe "#index" do
    it_behaves_like "a resource action with credentials"

    it "makes the correct request" do
      expect(RestClient::Request).to receive(:execute).
        with(hash_including(json_headers.merge(
          method: :get,
          url: Sendle::Api::Ping.url,
          user: sendle_id,
          password: api_key
        )))
    end
  end

end
