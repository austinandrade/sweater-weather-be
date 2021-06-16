require 'rails_helper'

RSpec.describe 'backgrounds show' do
  describe 'backgrounds requests' do
    it 'renders a single background based on passed location', :vcr do
      params = "denver, co"
      get "/api/v1/backgrounds?location=#{params}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.server_error?).to eq(false)

      photo_info = JSON.parse(response.body, symbolize_names: true)

      expect(photo_info).to have_key(:data)
      expect(photo_info[:data]).to be_a(Hash)

      expect(photo_info[:data]).to have_key(:id)
      expect(photo_info[:data][:id]).to eq(nil)

      expect(photo_info[:data]).to have_key(:type)
      expect(photo_info[:data][:type]).to eq("image")

      expect(photo_info[:data]).to have_key(:attributes)
      expect(photo_info[:data][:attributes]).to be_a(Hash)

      expect(photo_info[:data][:attributes]).to have_key(:image)
      expect(photo_info[:data][:attributes][:image]).to be_a(Hash)

      expect(photo_info[:data][:attributes][:image]).to have_key(:location)
      expect(photo_info[:data][:attributes][:image][:location]).to be_a(String)

      expect(photo_info[:data][:attributes][:image]).to have_key(:image_url)
      expect(photo_info[:data][:attributes][:image][:image_url]).to be_a(String)

      expect(photo_info[:data][:attributes][:image]).to have_key(:credit)
      expect(photo_info[:data][:attributes][:image][:credit]).to be_a(Hash)

      expect(photo_info[:data][:attributes][:image][:credit]).to have_key(:source)
      expect(photo_info[:data][:attributes][:image][:credit][:source]).to be_a(String)

      expect(photo_info[:data][:attributes][:image][:credit]).to have_key(:photographer)
      expect(photo_info[:data][:attributes][:image][:credit][:photographer]).to be_a(String)

      expect(photo_info[:data][:attributes][:image][:credit]).to have_key(:photographer_profile)
      expect(photo_info[:data][:attributes][:image][:credit][:photographer_profile]).to be_a(String)
    end

    it "returns 400 status when missing location param", :vcr do
      get "/api/v1/backgrounds"

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(400)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq("Please include location param")
    end

    it "returns 404 status when no locations are found", :vcr do
      random_param = "asdfasdf"
      get "/api/v1/backgrounds?location=#{random_param}"

      error_info = JSON.parse(response.body, symbolize_names: true)

      expect(response.successful?).to eq(false)
      expect(response.status).to eq(404)

      expect(error_info).to have_key(:errors)
      expect(error_info[:errors]).to eq('No images found with that location. Please try again.')
    end
  end
end
