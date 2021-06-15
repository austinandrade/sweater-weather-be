class LocationService
  class << self
    def get_lat_long_data(location)
      response = conn.get("/geocoding/v1/address?location=#{location}")
      parse_data(response)
    end

    def get_road_trip_data(start_city, end_city)
      response = conn.get("/directions/v2/route?from=#{start_city}&to=#{end_city}")
      parse_data(response)
    end

    private

    def conn
      Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
        faraday.params['key'] = ENV['mq']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
