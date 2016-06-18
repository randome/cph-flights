require 'rails_helper'

describe AirportService do
  describe ".departure_flights" do
    it "returns an array of expected flights" do
      expected_array = ["flights"]
      allow(HTTPClient).to receive(:get)

      allow(Parsers::CPHAirportFlightsParser).to receive(:parse_departure_flights)
      .and_return(expected_array)

      flights = AirportService.departure_flights

      expect(flights).to eq expected_array
    end
  end
end
