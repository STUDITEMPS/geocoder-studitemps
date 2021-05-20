# frozen_string_literal: true

require 'geocoder'
require 'geocoder/lookups/studitemps'

RSpec.describe Geocoder::Lookup::Studitemps do
  let(:hostname) { "studitemps-geocoder" }

  before do
    Geocoder.configure(
      lookup: :studitemps,
      studitemps: {
        host: hostname
      }
    )
  end

  it "patches the known geocoders array to include studitemps" do
    expect(Geocoder::Lookup.street_services).to include(:studitemps)
  end

  context "Valid address" do
    it "returns the geocode from studitemps" do
      body = { latitude: 50.948358, longitude: 6.9452432}
      stub_request(:get, "https://#{hostname}/geocode")
        .with(query: hash_including('address'))
        .to_return(body: body.to_json, status: 200, headers: {})

      coords = Geocoder.coordinates('Im Mediapark 4a, 50670 Köln')
      expect(coords).to eq [50.948358, 6.9452432]
    end
  end

  context "Invalid address" do
    it "returns nil when given an address that does not exist" do
      stub_request(:get, "https://#{hostname}/geocode")
        .with(query: hash_including('address'))
        .to_return(body: nil, status: 200, headers: {})

      coords = Geocoder.coordinates('Wineroad 222, 51103 The Kingsland')
      expect(coords).to be_nil
    end
  end
end
