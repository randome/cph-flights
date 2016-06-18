class HomeController < ApplicationController
  def show
    render locals: {
      departure_flights: AirportService.departure_flights
    }
  end
end
