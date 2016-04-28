require "spec_helper"

describe Sendle::Api::Ping do

  let(:api_key) { 'fake-key' }
  let(:sendle_id) { 'fake-id' }

  before do
    Sendle::Api.api_key = api_key
    Sendle::Api.sendle_id = sendle_id
  end

  describe "#execute" do
    it_behaves_like "a resource action with credentials"

    it "makes the correct request" do
      expected_params = json_headers.merge(
        method: :get,
        url: Sendle::Api::Ping.url,
        user: sendle_id,
        password: api_key
      )
      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params))

      Sendle::Api::Ping.execute
    end

    it "returns a pong" do
      expect(RestClient::Request).to receive(:execute)

      pong = Sendle::Api::Ping.execute

      expect(pong).to be_a Sendle::Api::Responses::Pong
    end

    it "handles unauthorized" do
      expect(RestClient::Request).to receive(:execute).and_raise(UNAUTHORIZED_ERROR)

      expect {
        Sendle::Api::Ping.execute
      }.to raise_error(Sendle::Api::Errors::Unauthorized)
    end
  end

end
