require "spec_helper"

describe Sendle::Api::Order do

  let(:api_key) { 'fake-key' }
  let(:sendle_id) { 'fake-id' }

  before do
    Sendle::Api.api_key = api_key
    Sendle::Api.sendle_id = sendle_id
  end

  describe "#create" do
    let(:params) {
      {
        pickup_date: "2015-11-24",
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

  end

end
