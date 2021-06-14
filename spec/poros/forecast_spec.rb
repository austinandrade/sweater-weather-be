require 'rails_helper'

RSpec.describe 'forecast object' do
  before :each do
    @forecast = Forecast.new(current_weather_data)
  end

  it 'exists' do
    expect(@forecast).to be_an_instance_of(Forecast)
  end

  it 'has attributes' do
    expect(@forecast.id).to eq(nil)
    expect(@forecast.current_weather).to be_a(Hash)
    expect(@forecast.daily_weather).to be_an(Array)
    expect(@forecast.hourly_weather).to be_an(Array)
  end
end
