require 'rails_helper'

feature "User Visits Homepage" do
  context "for depature flights" do
    it "sees a list of expected departure flights" do
      stub_request(:get, /cph.dk/).to_return(body: departures_html)

      home_page = Pages::Home.new

      visit '/'

      expect(home_page).to have_departure_flights(expected_departure_flights)
    end

    def expected_departure_flights
      [
        "Moscow, Russian Federation - SVO  Sheremetyevo International Airport",
        "Rhodes, Greece - RHO  Rhodes International Airport"
      ]
    end


    def departures_html
      File.open(Dir.pwd + '/spec/fixtures/html/' + 'cph_departures_lite.html', 'rb').read
    end
  end

  context "for arrival flights", :skip do
    it "sees a list of expected arrival flights" do
      home_page = Pages::Home.new

      visit '/'

      expect(home_page).to have_arrival_flights(expected_arrival_flights)
    end

    def expected_arrival_flights
      [
        "Beirut",
        "Manchester, Great Britain - MAN  Manchester Airport"
      ]
    end
  end
end
