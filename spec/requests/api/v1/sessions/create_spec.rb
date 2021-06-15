require 'rails_helper'

RSpec.describe 'sessions create' do
  describe 'user login requests' do
    it 'creates a sessions and returns the user a payload with their email and api key', :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )
      email                 = 'peanutbutter@bazinga.com'
      password              = 'thebeststuff'

      raw_data = { email: email,
                   password: password,
                 }.to_json

      post "/api/v1/sessions", params: raw_data

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.error?).to eq(false)

      user_info = JSON.parse(response.body, symbolize_names: true)

      expect(user_info).to have_key(:data)
      expect(user_info[:data]).to be_a(Hash)

      expect(user_info[:data]).to have_key(:id)
      expect(user_info[:data][:id]).to be_a(String)

      expect(user_info[:data]).to have_key(:type)
      expect(user_info[:data][:type]).to eq("users")

      expect(user_info[:data]).to have_key(:attributes)
      expect(user_info[:data][:attributes]).to be_a(Hash)

      expect(user_info[:data][:attributes].keys.count).to eq(2)

      expect(user_info[:data][:attributes]).to have_key(:email)
      expect(user_info[:data][:attributes][:email]).to be_a(String)

      expect(user_info[:data][:attributes]).to have_key(:api_key)
      expect(user_info[:data][:attributes][:api_key]).to be_an(String)
    end

    it "returns 400 status when username is incorrect", :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )
      email                 = 'peanutbutter@bazinga'
      password              = 'thebeststuff'

      raw_data = { email: email,
                   password: password,
                 }.to_json

      post "/api/v1/sessions", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq('Incorrect username or password. Please try again.')
    end

    it "returns 400 status when password is incorrect", :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', api_key: '1235453334' )
      email                 = 'peanutbutter@bazinga.com'
      password              = 'thebest'

      raw_data = { email: email,
                   password: password,
                 }.to_json

      post "/api/v1/sessions", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq('Incorrect username or password. Please try again.')
    end
  end
end
