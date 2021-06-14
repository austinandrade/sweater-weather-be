class BackgroundsFacade
  class << self
    def get_photo(location)
      create_photo_objects(BackgroundsService.get_photo_data(location), location)
    end

    private

    def create_photo_objects(photo_data, location)
      Photo.new(photo_data, location)
    end
  end
end
