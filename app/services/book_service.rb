class BookService
  class << self
    def get_book_data(location)
      response = conn.get("/search.json?q=#{location}")
      parse_data(response)
    end

    private

    def conn
     Faraday.new(url: 'http://openlibrary.org')
   end

   def parse_data(response)
     JSON.parse(response.body, symbolize_names: true)
   end
  end
end
