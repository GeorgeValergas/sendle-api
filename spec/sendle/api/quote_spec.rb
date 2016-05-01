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
      expected_params = {
        method: :get,
        url: Sendle::Api::Quote.url,
        headers: {
          accept: :json, 
          content_type: :json,
          params: params
        }
      }
      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params)).and_return(QUOTE_NO_PLAN_RESPONSE)

      Sendle::Api::Quote.execute(params)
    end

    it "throws an error if params are missing" do
      expect {
        Sendle::Api::Quote.execute
      }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: pickup_suburb, pickup_postcode, delivery_suburb, delivery_postcode, kilogram_weight. Please check your request and try again.")
    end

    it "returns correct response" do
      expect(RestClient::Request).to receive(:execute).and_return(QUOTE_NO_PLAN_RESPONSE)

      response = Sendle::Api::Quote.execute(params)

      expect(response.json).to eq JSON.parse(QUOTE_NO_PLAN_RESPONSE)
    end

    context "passing in a plan_name" do
      it "checks a valid plan name is passed in" do
        PLANS.each do |plan|
          params[:plan_name] = plan
          expect(RestClient::Request).to receive(:execute).and_return(QUOTE_NO_PLAN_RESPONSE)
          Sendle::Api::Quote.execute(params)
        end

        params[:plan_name] = 'invalid-plan'

        expect {
          Sendle::Api::Quote.execute(params)
        }.to raise_error(Sendle::Api::Errors::InvalidPlan, "invalid-plan is not in the list of valid plans: easy, premium, pro")
      end

      xit "respects the plan_name param" do
        params[:plan_name] = 'easy'

        response = Sendle::Api::Quote.execute(params)
      end
    end

    it "passes optional params" do

    end

    it "handles 422" do

    end
    
  end

end
