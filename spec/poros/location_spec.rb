require 'rails_helper'

RSpec.describe 'location object' do
  before :each do
    @location = Location.new(location_data)
  end

  it 'exists' do
    expect(@location).to be_an_instance_of(Location)
  end

  it 'has attributes' do
    expect(@location.latitude).to be_a(Float)
    expect(@location.longitude).to be_a(Float)
  end
end
