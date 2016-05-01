require "spec_helper"

describe Sendle::Api::Errors::MissingParams do

  describe "#to_s" do
    it "formats the message" do
      error = Sendle::Api::Errors::MissingParams.new(%w( pickup_address deliver_address ))

      expect(error.to_s).to eq "The following params are required: pickup_address, deliver_address. Please check your request and try again."
    end
  end

end
