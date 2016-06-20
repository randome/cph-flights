module Api
  class FlightsController < ApplicationController
    def index
      render json: AirportService.departure_flights
    end
  end
end
