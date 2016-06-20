require 'rails_helper'

describe Parsers::CPHAirportFlightsParser do
  describe ".parse_departure_flights" do
    it "parses html text to expected array of hashes" do
      parsed_array = described_class.parse_departure_flights(departures_html)

      expect(parsed_array).to match(expected_array)
    end

    def departures_html
      File.open(Dir.pwd + '/spec/fixtures/html/' + 'cph_departures_lite.html', 'rb').read
    end

    def expected_array
      [
        {
          scheduled_time: "12:10 AM",
          delayed_time: "",
          airline: "Aeroflot",
          destination: "Moscow, Russian Federation - SVO  Sheremetyevo International Airport",
          gate: "C35",
          terminal: 'T3',
          flight_status: 'Closed'
        },
        {
          scheduled_time: "12:30 AM",
          delayed_time: "",
          airline: "Thomas Cook Airlines",
          destination: "Rhodes, Greece - RHO  Rhodes International Airport",
          gate: "B7",
          terminal: '',
          flight_status: ''
        }
      ]
    end
  end
end
