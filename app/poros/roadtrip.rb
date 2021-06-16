class Roadtrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time
  def initialize(road_trip_data, start_city, end_city, forecast)
    @id                 = nil
    @start_city         = start_city
    @end_city           = end_city
    @travel_time        = road_trip_data.present? ? road_trip_data[:route][:formattedTime]  : "impossible"
    @real_time          = road_trip_data.present? ? road_trip_data[:route][:legs][0][:time] : {}
    @forecast           = forecast
    @weather_on_arrival = weather_on_arrival
    @weather_at_eta     = weather_at_eta
  end

  def weather_at_eta
    if @weather_on_arrival.present?
      {
        temperature: @weather_on_arrival[:temperature],
        conditions:  @weather_on_arrival[:conditions]
      }
    else
      {}
    end
  end

  def weather_on_arrival
    twenty_four_hours_to_seconds = 86400
    if @real_time.present?
      if @real_time <= twenty_four_hours_to_seconds
        @forecast.road_trip_weather[0..23].find do |hour|
          hour[:time] == format_travel_time(@real_time)
        end
      else
        @forecast.road_trip_weather[24..48].find do |hour|
          hour[:time] == format_travel_time(@real_time)
        end
      end
    else
      nil
    end
  end

  def format_travel_time(travel_time)
    (Time.now + travel_time.seconds).beginning_of_hour.strftime('%T')
  end
end
