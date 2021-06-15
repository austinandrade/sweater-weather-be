class LocationService
  class << self
    def get_lat_long_data(location)
      response = conn.get("/geocoding/v1/address?location=#{location}")
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
