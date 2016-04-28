require "spec_helper"

describe Sendle::Api do
  
  it "allows setting of the api_key" do
    api_key = "testing-api-key"

    Sendle::Api.api_key = api_key

    expect(Sendle::Api.api_key).to eq api_key
  end

  it "allows setting the sendle_id" do
    sendle_id = "testing-sendle-id"

    Sendle::Api.sendle_id = sendle_id

    expect(Sendle::Api.sendle_id).to eq sendle_id
  end
end
