class Forecast
  attr_reader :id

  def initialize(weather_data)
    @id              = nil
    @weather_data    = weather_data
    @current_weather = current_weather
    @daily_weather   = daily_weather
    @hourly_weather  = hourly_weather
  end

  def current_weather
    {
      datetime: format_epoch_time(@weather_data[:current][:dt]),
      sunrise: format_epoch_time(@weather_data[:current][:sunrise]),
      sunset: format_epoch_time(@weather_data[:current][:sunset]),
      temperature: @weather_data[:current][:temp],
      feels_like: @weather_data[:current][:feels_like],
      humidity: @weather_data[:current][:humidity],
      uvi: @weather_data[:current][:uvi],
      visibility: @weather_data[:current][:humidity],
      conditions: @weather_data[:current][:weather][0][:description],
      icon: @weather_data[:current][:weather][0][:icon]
    }
  end

  def daily_weather
    @weather_data[:daily][0..4].map do |day_data|
      {
        date: format_epoch_time(day_data[:dt]).strftime('%Y-%m-%d'),
        sunrise: format_epoch_time(day_data[:sunrise]),
        sunset: format_epoch_time(day_data[:sunset]),
        max_temp: day_data[:temp][:max],
        min_temp: day_data[:temp][:min],
        conditions: day_data[:weather][0][:description],
        icon: day_data[:weather][0][:icon]
      }
    end
  end

  def hourly_weather
    @weather_data[:hourly][0..7].map do |hour_data|
      {
        time: format_epoch_time(hour_data[:dt]).strftime('%T'),
        temperature: hour_data[:temp],
        conditions: hour_data[:weather][0][:description],
        icon: hour_data[:weather][0][:icon]
      }
    end
  end

  def format_epoch_time(epoch_time)
    Time.zone.at(epoch_time)
  end
end
