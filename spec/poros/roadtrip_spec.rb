require 'rails_helper'

RSpec.describe 'roadtrip object' do
  before :each do
    @start_city = 'Denver, CO'
    @end_city = 'Austin, TX'
    forecast_object = Forecast.new(current_weather_data)
    @roadtrip = Roadtrip.new(good_location_data, @start_city, @end_city, forecast_object)
  end

  it 'exists' do
    expect(@roadtrip).to be_an_instance_of(Roadtrip)
  end

  it 'has attributes' do
    expect(@roadtrip.id).to eq(nil)

    expect(@roadtrip.start_city).to eq(@start_city)
    expect(@roadtrip.start_city).to be_a(String)

    expect(@roadtrip.end_city).to eq(@end_city)
    expect(@roadtrip.end_city).to be_a(String)

    expect(@roadtrip.travel_time).to be_a(String)

    expect(@roadtrip.weather_at_eta).to be_a(Hash)

    expect(@roadtrip.weather_at_eta).to have_key(:temperature)
    expect(@roadtrip.weather_at_eta[:temperature]).to be_a(Float)

    expect(@roadtrip.weather_at_eta).to have_key(:conditions)
    expect(@roadtrip.weather_at_eta[:conditions]).to be_a(String)
  end
end
