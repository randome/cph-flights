module Pages
  class Home
    include Capybara::DSL

    def filter_by_destination(destination)
      page.fill_in 'Search', with: destination
    end

    def has_departure_flights?(departure_flights)
      departure_flights.map do |flight|
        return false unless page.has_text?(flight)
      end
    end

    def has_arrival_flights?(arrival_flights)
      arrival_flights.map do |flight|
        return false unless page.has_text?(flight)
      end
    end
  end
end
