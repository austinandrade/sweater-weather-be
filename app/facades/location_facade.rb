class LocationFacade
  class << self
    def get_lat_long(location)
      create_location_objects(LocationService.get_lat_long_data(location)[:results][0][:locations][0])
    end

    private

    def create_location_objects(location_data)
      Location.new(location_data)
    end
  end
end
