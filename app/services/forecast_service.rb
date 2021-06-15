class ForecastService
  class << self
    def get_current_weather_data(latitude, longitude)
      response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}")
      parse_data(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
        faraday.params['appid'] = ENV['weather']
        faraday.params['exclude'] = 'minutely,alerts'
        faraday.params['units'] = 'imperial'
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
