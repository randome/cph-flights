require 'rails_helper'

feature "User Visits Homepage", :js do
  context "user filters results on destination" do
    it "sees expected flights in the flights table" do
      stub_request(:get, /cph.dk/).to_return(body: departures_html)

      visit '/'

      home_page = Pages::Home.new

      home_page.filter_by_destination('greece')

      expect(home_page).to have_departure_flights(expected_departure_flights)
    end

    def expected_departure_flights
      [
        "Rhodes, Greece - RHO  Rhodes International Airport"
      ]
    end

    def departures_html
      File.open(Dir.pwd + '/spec/fixtures/html/' + 'cph_departures_lite.html', 'rb').read
    end
  end
end

