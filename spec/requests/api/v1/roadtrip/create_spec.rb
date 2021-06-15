require 'rails_helper'

RSpec.describe 'roadtrip create' do
  describe 'roadtrip requests' do
    it 'renders all correct roadtrip data', :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )

      origin      =  "Denver, CO"
      destination =  "Cleveland, OH"
      api_key     =  user.api_key

      raw_data = { origin: origin,
                   destination: destination,
                   api_key: api_key
                 }.to_json

      post "/api/v1/road_trip", params: raw_data

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.error?).to eq(false)

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to be_a(Hash)

      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq(nil)

      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to eq("roadtrip")

      expect(road_trip[:data]).to have_key(:attributes)

      expect(road_trip[:data][:attributes].keys.count).to eq(4)

      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_an(String)

      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_an(String)

      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_an(Hash)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it 'returns correct time for long distance travel', :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )

      origin      =  "New York, NY"
      destination =  "Los Angeles, CA"
      api_key     =  user.api_key

      raw_data = { origin: origin,
                   destination: destination,
                   api_key: api_key
                 }.to_json

      post "/api/v1/road_trip", params: raw_data

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.error?).to eq(false)

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to be_a(Hash)

      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq(nil)

      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to eq("roadtrip")

      expect(road_trip[:data]).to have_key(:attributes)

      expect(road_trip[:data][:attributes].keys.count).to eq(4)

      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_an(String)

      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_an(String)

      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_an(Hash)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it "returns impossible if trip is an impossible route", :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )

      origin      =  "Denver, CO"
      destination =  "London, UK"
      api_key     =  user.api_key

      raw_data = { origin: origin,
                   destination: destination,
                   api_key: api_key
                 }.to_json

      post "/api/v1/road_trip", params: raw_data

      expect(response.successful?).to eq(true)
      expect(response.status).to eq(200)

      invalid_location = JSON.parse(response.body, symbolize_names: true)

      expect(invalid_location).to have_key(:data)
      expect(invalid_location[:data]).to be_a(Hash)

      expect(invalid_location[:data]).to have_key(:id)
      expect(invalid_location[:data][:id]).to eq(nil)

      expect(invalid_location[:data]).to have_key(:type)
      expect(invalid_location[:data][:type]).to eq("roadtrip")

      expect(invalid_location[:data]).to have_key(:attributes)

      expect(invalid_location[:data][:attributes].keys.count).to eq(4)

      expect(invalid_location[:data][:attributes]).to have_key(:start_city)
      expect(invalid_location[:data][:attributes][:start_city]).to be_a(String)

      expect(invalid_location[:data][:attributes]).to have_key(:end_city)
      expect(invalid_location[:data][:attributes][:end_city]).to be_a(String)

      expect(invalid_location[:data][:attributes]).to have_key(:travel_time)
      expect(invalid_location[:data][:attributes][:travel_time]).to be_a(String)
      expect(invalid_location[:data][:attributes][:travel_time]).to eq("impossible")

      expect(invalid_location[:data][:attributes]).to have_key(:weather_at_eta)
      expect(invalid_location[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(invalid_location[:data][:attributes][:weather_at_eta].empty?).to eq(true)
    end

    it "returns 401 Unauthorized if api_key is input incorrectly or is missing", :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )

      origin      =  "Denver, CO"
      destination =  "Cleveland, OH"
      api_key     =  "123"

      raw_data = { origin: origin,
                   destination: destination,
                   api_key: api_key
                 }.to_json

      post "/api/v1/road_trip", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(401)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq("Unauthorized! Please provide a valid api key.")
    end

    it "returns 400 error if origin is missing", :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )

      origin      =  "Denver, CO"
      destination =  "Cleveland, OH"
      api_key     =  "123"

      raw_data = { destination: destination,
                   api_key: api_key
                 }.to_json

      post "/api/v1/road_trip", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq("Please provide an origin, destination, and api key!")
    end

    it "returns 400 error if destination is missing", :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )

      origin      =  "Denver, CO"
      destination =  "Cleveland, OH"
      api_key     =  "123"

      raw_data = { origin: origin,
                   api_key: api_key
                 }.to_json

      post "/api/v1/road_trip", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq("Please provide an origin, destination, and api key!")
    end
  end
end
