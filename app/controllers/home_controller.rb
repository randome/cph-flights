class HomeController < ApplicationController
  def show
    render locals: {
      departure_flights: departure_flights
    }
  end

  private

  def departure_flights
    [OpenStruct.new({
      scheduled_time: Time.now,
      delayed_time: 5.minutes.from_now,
      airline: 'JetBlue',
      destination: 'America',
      gate: '5G',
      terminal: 'Terminal 3',
      flight_status: 'Boarding'
    })]
  end
end
