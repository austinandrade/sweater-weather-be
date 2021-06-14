class BookSearchFacade
  class << self
    def get_books(location, limit, current_weather)
      create_books(BookSearchService.get_book_data(location), current_weather, limit, location)
    end

    private

    def create_books(book_data, current_weather, limit, location)
      Book.new(book_data, current_weather, limit, location)
    end
  end
end
