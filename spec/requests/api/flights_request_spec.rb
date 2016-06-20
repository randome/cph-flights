require 'rails_helper'

describe "API flights endpoint", type: :request do
  describe "/api/flights/" do
    it "returns a json array of expected flights" do
      stub_request(:get, /cph.dk/).to_return(body: departures_html)

      headers = {
        "ACCEPT" => "application/json"
      }

      get '/api/flights', headers

      expect(response.body).to eq expected_json_flights
    end

    def expected_json_flights
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
      ].to_json
    end

    def departures_html
      File.open(Dir.pwd + '/spec/fixtures/html/' + 'cph_departures_lite.html', 'rb').read
    end
  end
end
