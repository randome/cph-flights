class AirportService

  def initialize(airport_website)
    @website = airport_website
  end

  def self.departure_flights
    new(CPHAirportWebsite.new).departure_flights
  end

  def departure_flights
    html = http_client.get(website.flight_departures_url)
    flights_parser.parse_departure_flights(html)
  end

  private

  attr_reader :website

  def http_client
    HTTPClient
  end

  def flights_parser
    Parsers::CPHAirportFlightsParser
  end

  # TODO: This could be in configuration
  class CPHAirportWebsite
    def flight_departures_url
      "https://www.cph.dk/en/flight-info/departures1/"
    end
  end
end
