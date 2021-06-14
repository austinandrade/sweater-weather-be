require 'rails_helper'

RSpec.describe 'book object' do
  before :each do
    @limit = 5
    @destination = 'denver, co'
    @book = Book.new(book_search_data, current_weather_data, @limit, @destination)
  end

  it 'exists' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'has attributes' do
    expect(@book.id).to eq(nil)
    expect(@book.destination).to eq(@destination)
    expect(@book.forecast).to be_a(Hash)

    expect(@book.forecast).to have_key(:summary)
    expect(@book.forecast[:summary]).to be_a(String)

    expect(@book.forecast).to have_key(:temperature)
    expect(@book.forecast[:temperature]).to be_a(String)

    expect(@book.total_books_found).to eq(606)

    expect(@book.books).to be_an(Array)
  end
end
