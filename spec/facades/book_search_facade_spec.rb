require "rails_helper"

describe 'BookSearchFacade' do
  it 'exists' do
    book_facade = BookSearchFacade.new
    expect(book_facade).to be_an_instance_of(BookSearchFacade)
  end

  describe '#get_books' do
    it 'creates and returns a Book object', :vcr do
      location = 'denver, co'
      limit = 5
      book = BookSearchFacade.get_books(location, limit, current_weather_data)
      expect(book).to be_an_instance_of(Book)
    end
  end
end
