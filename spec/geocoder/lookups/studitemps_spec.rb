# frozen_string_literal: true

require 'geocoder'
require 'geocoder/lookups/studitemps'

RSpec.describe Geocoder::Lookup::Studitemps do
  before do
    Geocoder.configure(lookup: :studitemps)
  end

  it "patches the known geocoders array to include studitemps" do
    expect(Geocoder::Lookup.street_services).to include(:studitemps)
  end

  RSpec.describe "Valid address" do
    it "returns the geocode from studitemps" do
      body = { lat: 50.948358, lon: 6.9452432}
      stub_request(:get, 'https://geocoder-studitemps.herokuapp.com/geocoder')
        .with(query: hash_including('address'))
        .to_return(body: body.to_json, status: 200, headers: {})

      coords = Geocoder.coordinates('Im Mediapark 4a, 50670 Köln')
      expect(coords).to eq [50.948358, 6.9452432]
    end
  end
end
