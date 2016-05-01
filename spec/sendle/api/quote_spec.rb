require "spec_helper"

describe Sendle::Api::Quote do

  describe "#execute" do
    it "makes the correct request" do
      expected_params = json_headers.merge(
        method: :get,
        url: Sendle::Api::Quote.url
      )
      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params))

      Sendle::Api::Quote.execute
    end
  end

end
