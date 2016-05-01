require "spec_helper"

describe Sendle::Api::Quote do

  describe "#execute" do
    let(:params) {
      {
        pickup_suburb: 'woolloomooloo',
        pickup_postcode: '2011',
        delivery_suburb: 'eastgardens',
        delivery_postcode: '2036',
        kilogram_weight: '1'
      }
    }

    it "makes the correct request" do
      expected_params = json_headers.merge(
        method: :get,
        url: Sendle::Api::Quote.url
      )
      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params))

      Sendle::Api::Quote.execute(params)
    end

    it "throws error if required params are missing" do
      expect {
        Sendle::Api::Quote.execute
      }.to raise_error(Sendle::Api::Errors::MissingParams)
    end
  end

end
