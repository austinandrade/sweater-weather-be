class ForecastFacade
  class << self
    def get_forecast(latitude, longitude)
      create_forecast_objects(ForecastService.get_current_weather_data(latitude, longitude))
    end

    private

    def create_forecast_objects(current_weather_data)
      Forecast.new(current_weather_data)
    end
  end
end
