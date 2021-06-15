class BackgroundsFacade
  class << self
    def get_photo(location)
      service_result = BackgroundsService.get_photo_data(location)
      if service_result[:results].empty?
        nil
      else
        create_photo_objects(service_result, location)
      end
    end

    private

    def create_photo_objects(photo_data, location)
      Photo.new(photo_data, location)
    end
  end
end
