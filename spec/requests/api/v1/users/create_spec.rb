require 'rails_helper'

RSpec.describe 'users create' do
  describe 'new user requests' do
    it 'creates a new user if passwords match and it does not exist', :vcr do
      email                 = 'peanutbutter@bazinga.com'
      password              = 'thebeststuff'
      password_confirmation = 'thebeststuff'

      raw_data = { email: email,
                   password: password,
                   password_confirmation: password_confirmation
                 }.to_json

      post "/api/v1/users", params: raw_data

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

    it "returns 400 status when passwords don't match", :vcr do
      email                 = 'peanutbutter@bazinga.com'
      password              = 'thebest'
      password_confirmation = 'thebeststuff'

      raw_data = { email: email,
                   password: password,
                   password_confirmation: password_confirmation
                 }.to_json

      post "/api/v1/users", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq("Password confirmation doesn't match Password, Password confirmation doesn't match Password")
    end

    it "returns 400 status when email is already taken", :vcr do
      user = User.create!(email: 'peanutbutter@bazinga.com', password: 'thebeststuff', password_confirmation: 'thebeststuff', api_key: '1235453334' )

      email                 = 'peanutbutter@bazinga.com'
      password              = 'thebeststuff'
      password_confirmation = 'thebeststuff'

      raw_data = { email: email,
                   password: password,
                   password_confirmation: password_confirmation
                 }.to_json

      post "/api/v1/users", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq("Email has already been taken")
    end

    it "returns 400 status when a email, password, or password confirmation is missing", :vcr do
      email                 = 'peanutbutter@bazinga.com'
      password_confirmation = 'thebeststuff'

      raw_data = { email: email,
                   password_confirmation: password_confirmation
                 }.to_json

      post "/api/v1/users", params: raw_data

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq("Password can't be blank, Password can't be blank, Password digest can't be blank, Password confirmation doesn't match Password")
    end
  end
end
