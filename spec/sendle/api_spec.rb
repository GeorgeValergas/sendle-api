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

  it "turns off sandbox mode by default" do
    expect(Sendle::Api.sandbox).to eq false
  end

  it "allows turning on sandbox mode" do
    Sendle::Api.sandbox = true

    expect(Sendle::Api.sandbox).to eq true
  end

  it "uses sandbox api uri when in sandbox mode" do
    Sendle::Api.sandbox = true

    expect(Sendle::Api.base_url).to eq 'https://sandbox.sendle.com/api/'
  end

  it "uses live api uri when not in sandbox mode" do
    Sendle::Api.sandbox = false

    expect(Sendle::Api.base_url).to eq 'https://www.sendle.com/api/'
  end
end
