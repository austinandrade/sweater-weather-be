class LocationFacade
  class << self
    def get_lat_long(location)
      create_location_objects(LocationService.get_lat_long_data(location)[:results][0][:locations][0])
    end

    def get_road_trip(start_city, end_city, forecast)
      location_result = LocationService.get_road_trip_data(start_city, end_city)
      if location_result[:info][:statuscode] == 402
        create_road_trip_objects({}, start_city, end_city, forecast)
      else
        create_road_trip_objects(location_result, start_city, end_city, forecast)
      end
    end

    private

    def create_location_objects(location_data)
      Location.new(location_data)
    end

    def create_road_trip_objects(road_trip_data, start_city, end_city, forecast)
      RoadTrip.new(road_trip_data, start_city, end_city, forecast)
    end
  end
end
