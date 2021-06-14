require 'rails_helper'

RSpec.describe 'forecast show' do
  describe 'current weather requests' do
    it 'renders all correct weather data', :vcr do
      params = "denver, co"
      get "/api/v1/forecast?location=#{params}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.error?).to eq(false)

      weather_info = JSON.parse(response.body, symbolize_names: true)

      expect(weather_info).to have_key(:data)
      expect(weather_info[:data]).to be_a(Hash)

      expect(weather_info[:data]).to have_key(:id)
      expect(weather_info[:data][:id]).to eq(nil)

      expect(weather_info[:data]).to have_key(:type)
      expect(weather_info[:data][:type]).to eq("forecast")

      expect(weather_info[:data]).to have_key(:attributes)

      expect(weather_info[:data][:attributes].keys.count).to eq(3)

      expect(weather_info[:data][:attributes]).to have_key(:current_weather)
      expect(weather_info[:data][:attributes][:current_weather]).to be_a(Hash)

      expect(weather_info[:data][:attributes]).to have_key(:daily_weather)
      expect(weather_info[:data][:attributes][:daily_weather]).to be_an(Array)

      expect(weather_info[:data][:attributes]).to have_key(:hourly_weather)
      expect(weather_info[:data][:attributes][:hourly_weather]).to be_an(Array)

      expect(weather_info[:data][:attributes][:current_weather].count).to eq(10)
      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(weather_info[:data][:attributes][:current_weather][:datetime]).to be_a(String)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(weather_info[:data][:attributes][:current_weather][:sunrise]).to be_a(String)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(weather_info[:data][:attributes][:current_weather][:sunset]).to be_a(String)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(weather_info[:data][:attributes][:current_weather][:temperature]).to be_a(Float)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(weather_info[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(weather_info[:data][:attributes][:current_weather][:humidity]).to be_an(Integer)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(weather_info[:data][:attributes][:current_weather][:uvi]).to be_an(Integer)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(weather_info[:data][:attributes][:current_weather][:visibility]).to be_an(Integer)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(weather_info[:data][:attributes][:current_weather][:conditions]).to be_a(String)

      expect(weather_info[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(weather_info[:data][:attributes][:current_weather][:icon]).to be_a(String)

      weather_info[:data][:attributes][:daily_weather].each do |weather|
        expect(weather).to have_key(:date)
        expect(weather[:date]).to be_a(String)

        expect(weather).to have_key(:sunrise)
        expect(weather[:sunrise]).to be_a(String)

        expect(weather).to have_key(:sunset)
        expect(weather[:sunset]).to be_a(String)

        expect(weather).to have_key(:max_temp)
        expect(weather[:max_temp]).to be_a(Float)

        expect(weather).to have_key(:min_temp)
        expect(weather[:min_temp]).to be_a(Float)

        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to be_a(String)

        expect(weather).to have_key(:icon)
        expect(weather[:icon]).to be_a(String)
      end

      weather_info[:data][:attributes][:hourly_weather].each do |weather|
        expect(weather).to have_key(:time)
        expect(weather[:time]).to be_a(String)

        expect(weather).to have_key(:temperature)
        expect(weather[:temperature]).to be_a(Float)

        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to be_a(String)

        expect(weather).to have_key(:icon)
        expect(weather[:icon]).to be_a(String)
      end
    end
  end
end
