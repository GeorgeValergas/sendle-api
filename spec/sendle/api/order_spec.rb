require "spec_helper"

describe Sendle::Api::Order do

  let(:api_key) { 'fake_key' }
  let(:sendle_id) { 'fake_id' }

  before do
    Sendle::Api.api_key = api_key
    Sendle::Api.sendle_id = sendle_id
  end

  describe "#create" do
    let(:params) {
      {
        pickup_date: "2016-05-05",
        description: "Kryptonite",
        kilogram_weight: 1,
        cubic_metre_volume: 0.01,
        customer_reference: "SupBdayPressie",
        sender: {
          contact: {
            name: "Lex Luthor",
            phone: "0412 345 678"
          },
          address: {
            address_line1: "123 Gotham Ln",
            suburb: "Sydney",
            state_name: "NSW",
            postcode: "2000",
            country: "Australia"
          },
          instructions: "Knock loudly"
        },
        receiver: {
          contact: {
            name: "Clark Kent",
            email: "clarkissuper@dailyplanet.xyz"
          },
          address: {
            address_line1: "80 Wentworth Park Road",
            suburb: "Glebe",
            state_name: "NSW",
            postcode: "2037",
            country: "Australia"
          },
          instructions: "Give directly to Clark"
        }
      }
    }

    it_behaves_like "a resource action with credentials"

    describe "parcel param validation" do
      it "validates presence of required params" do
        params[:pickup_date] = nil
        params[:kilogram_weight] = nil
        params[:cubic_metre_volume] = nil

        expect {
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: pickup_date, kilogram_weight, cubic_metre_volume. Please check your request and try again.")
      end
    end

    describe "sender details" do
      it "validates presence of sender object" do
        params[:sender] = nil

        expect {
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: sender. Please check your request and try again.")
      end

      it "validates presence of contact" do
        params[:sender][:contact] = nil

        expect {
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: sender:contact. Please check your request and try again.")
      end

      it "validates name and phone of contact" do
        expect {
          [:phone, :name].each { |attr|  params[:sender][:contact][attr] = nil }
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: name, phone. Please check your request and try again.")
      end

      it "validates presence of address" do
        params[:sender][:address] = nil

        expect {
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: sender:address. Please check your request and try again.")
      end

      it "validates address_line1, suburb, postcode, state_name of the address" do
        expect {
          [:address_line1, :suburb, :postcode, :state_name].each { |attr|  params[:sender][:address][attr] = nil }
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: address_line1, suburb, postcode, state_name. Please check your request and try again.")
      end
    end 

    describe "receiver details" do
      it "validates presence of receiver object" do
        params[:receiver] = nil

        expect {
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: receiver. Please check your request and try again.")
      end

      it "validates presence of contact" do
        params[:receiver][:contact] = nil

        expect {
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: receiver:contact. Please check your request and try again.")
      end

      it "validates name of receiver" do
        expect {
          params[:receiver][:contact][:name] = nil 
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: name. Please check your request and try again.")
      end

      it "validates presence of address" do
        params[:receiver][:address] = nil

        expect {
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: receiver:address. Please check your request and try again.")
      end

      it "validates address_line1, suburb, postcode, state_name of the address" do
        expect {
          [:address_line1, :suburb, :postcode, :state_name].each { |attr|  params[:receiver][:address][attr] = nil }
          Sendle::Api::Order.create(params)
        }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: address_line1, suburb, postcode, state_name. Please check your request and try again.")
      end
    end 

    it "handles 412" do
      expect(RestClient::Request).to receive(:execute).and_raise(PRECONDITION_FAILED_ERROR)

      expect {
        Sendle::Api::Order.create(params)
      }.to raise_error(Sendle::Api::Errors::PreconditionFailed, "The account associated with this API key has not accepted the dangerous goods terms. Please visit your Account Settings in https://www.sendle.com/dashboard/ to view and accept these terms.")
    end

    it "makes the correct request" do
      expected_params = {
        method: :post,
        url: Sendle::Api::Order.url,
        headers: {
          accept: :json, 
          content_type: :json
        },
        payload: params
      }

      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params)).and_return(ORDER_CREATED_RESPONSE)

      Sendle::Api::Order.create(params)
    end

    it "returns the correct response" do
      allow(RestClient::Request).to receive(:execute).and_return(ORDER_CREATED_RESPONSE)

      response = Sendle::Api::Order.create(params)

      expect(response).to be_a Sendle::Api::Responses::Json
      expect(response.json).to eq JSON.parse(ORDER_CREATED_RESPONSE)
    end

  end

  describe "#show" do
    let(:order_id) { "9dbadcd6-ee57-488e-a175-49e378ad29ff" }

    it "throws an error if id isn't provided" do
      expect {
        Sendle::Api::Order.show(nil)
      }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: id. Please check your request and try again.")
    end

    it "makes the correct request" do
      expected_params = {
        method: :get,
        url: Sendle::Api::Order.url + "/#{order_id}",
        headers: {
          accept: :json, 
          content_type: :json
        }
      }

      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params)).and_return(ORDER_CREATED_RESPONSE)

      Sendle::Api::Order.show(order_id) 
    end

    it "returns the correct response" do
      allow(RestClient::Request).to receive(:execute).and_return(ORDER_GET_RESPONSE)

      response = Sendle::Api::Order.show(order_id)

      expect(response).to be_a Sendle::Api::Responses::Json
      expect(response.json).to eq JSON.parse(ORDER_GET_RESPONSE)
    end
  end

  describe "#destroy" do
    let(:order_id) { "9dbadcd6-ee57-488e-a175-49e378ad29ff" }

    it "throws an error if id isn't provided" do
      expect {
        Sendle::Api::Order.destroy(nil)
      }.to raise_error(Sendle::Api::Errors::MissingParams, "The following params are required: id. Please check your request and try again.")
    end

    it "makes the correct request" do
      expected_params = {
        method: :delete,
        url: Sendle::Api::Order.url + "/#{order_id}",
        headers: {
          accept: :json, 
          content_type: :json
        }
      }

      expect(RestClient::Request).to receive(:execute).with(hash_including(expected_params)).and_return(ORDER_CREATED_RESPONSE)

      Sendle::Api::Order.show(order_id) 
    end

    xit "returns the correct response" do
      allow(RestClient::Request).to receive(:execute).and_return(ORDER_GET_RESPONSE)

      response = Sendle::Api::Order.show(order_id)

      expect(response).to be_a Sendle::Api::Responses::Json
      expect(response.json).to eq JSON.parse(ORDER_GET_RESPONSE)
    end
  end

end
