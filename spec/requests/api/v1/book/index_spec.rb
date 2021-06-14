require 'rails_helper'

RSpec.describe 'book index' do
  describe 'book requests' do
    it 'returns selection of books based on passed location and quantity params', :vcr do
      params = "denver, co"
      quantity = 5
      get "/api/v1/book-search?location=#{params}&quantity=#{quantity}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.error?).to eq(false)

      weather_info = JSON.parse(response.body, symbolize_names: true)

      expect(weather_info).to have_key(:data)
      expect(weather_info[:data]).to be_a(Hash)

      expect(weather_info[:data]).to have_key(:id)
      expect(weather_info[:data][:id]).to eq(nil)

      expect(weather_info[:data]).to have_key(:type)
      expect(weather_info[:data][:type]).to eq("books")

      expect(weather_info[:data]).to have_key(:attributes)

      expect(weather_info[:data][:attributes].keys.count).to eq(4)

      expect(weather_info[:data][:attributes]).to have_key(:destination)
      expect(weather_info[:data][:attributes][:destination]).to be_a(String)

      expect(weather_info[:data][:attributes]).to have_key(:forecast)
      expect(weather_info[:data][:attributes][:forecast]).to be_an(Hash)

      expect(weather_info[:data][:attributes]).to have_key(:forecast)
      expect(weather_info[:data][:attributes][:forecast]).to be_an(Hash)

      expect(weather_info[:data][:attributes][:forecast]).to have_key(:summary)
      expect(weather_info[:data][:attributes][:forecast][:summary]).to be_a(String)

      expect(weather_info[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(weather_info[:data][:attributes][:forecast][:temperature]).to be_a(String)

      expect(weather_info[:data][:attributes]).to have_key(:total_books_found)
      expect(weather_info[:data][:attributes][:total_books_found]).to be_an(Integer)

      expect(weather_info[:data][:attributes]).to have_key(:books)
      expect(weather_info[:data][:attributes][:books]).to be_an(Array)
      expect(weather_info[:data][:attributes][:books].count).to eq(quantity)

      weather_info[:data][:attributes][:books].each do |book|
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an(Array)
        book[:isbn].each do |isbn|
          expect(isbn).to be_a(String)
        end

        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)

        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_an(Array)
        book[:publisher].each do |publisher|
          expect(publisher).to be_a(String)
        end
      end
    end
  end
end
