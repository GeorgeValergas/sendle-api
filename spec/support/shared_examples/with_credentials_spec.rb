shared_examples_for "a resource action with credentials" do

  describe "setting of credentials" do
    described_resource = example.metadata[:described_class]
    described_action = example.metadata[:example_group][:parent_example_group][:parent_example_group][:description_args].first.gsub("#", "")

    before do
      allow(RestClient::Request).to receive(:execute)
    end

    it "throws an missing sendle_id error" do
      Sendle::Api.sendle_id = nil
      Sendle::Api.api_key = 'fake-key'

      expect {
        described_resource.send(described_action)
      }.to raise_error Sendle::Api::Errors::MissingSendleId
    end

    it "throws an missing api_key error" do
      Sendle::Api.sendle_id = 'fake-id'
      Sendle::Api.api_key = nil

      expect {
        described_resource.send(described_action)
      }.to raise_error Sendle::Api::Errors::MissingApiKey
    end

    it "does not throw errors if both api_key and sendle_id are set" do
      Sendle::Api.sendle_id = 'sdfsfdsf'
      Sendle::Api.api_key = 'sdfsfdsf'

      expect {
        described_resource.send(described_action)
      }.to_not raise_error 
    end
  end

end
