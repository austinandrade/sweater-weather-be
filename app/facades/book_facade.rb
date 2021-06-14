class BookFacade
  class << self
    def get_books(location, limit, current_weather, destination)
      create_books(BookService.get_book_data(location), current_weather, limit, destination)
    end

    private

    def create_books(book_data, current_weather, limit, destination)
      Book.new(book_data, current_weather, limit, destination)
    end
  end
end
