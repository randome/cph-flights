module Parsers
  class CPHAirportFlightsParser
    def self.parse_departure_flights(html)
      new(Nokogiri::HTML(html)).parse_departure_flights
    end

    def initialize(html_doc)
      @html_doc = html_doc
    end

    def parse_departure_flights
      departure_flights = []
      each_table_row do |table_row|
        departure_flights << parse_flight_info(table_row)
      end
      departure_flights
    end

    private

    attr_reader :html_doc

    def parse_flight_info(table_row)
      flight_info = {}
      flight_info_attributes.each do |name, xpath|
        flight_info[name] = xpath_text(table_row, xpath).strip
      end
      OpenStruct.new(flight_info)
    end

    def xpath_text(table_row, xpath)
      table_row.at_xpath(xpath).try(:text) || ""
    end

    def flight_info_attributes
      {
        scheduled_time: 'td[@class="scheduled-time"]/span[1]',
        delayed_time: 'td[@class="delayed-time"]',
        airline: 'td[@class="airlines"]',
        destination: 'td[@class="flight-destin"]/strong',
        gate: 'td[@title="Gate"]',
        terminal: 'td[contains(@class, "terminal")]',
        flight_status: 'td/span[contains(@class, "flight-label")]'
      }
    end

    def each_table_row(&block)
      html_doc.xpath('//table[@class="info-table"]/tbody/tr').each do |tr|
        yield tr
      end
    end
  end
end
