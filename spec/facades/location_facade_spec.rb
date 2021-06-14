require "rails_helper"

RSpec.describe 'LocationFacade' do
  it 'exists' do
    location_facade = LocationFacade.new
    expect(location_facade).to be_an_instance_of(LocationFacade)
  end

  describe '#get_lat_long' do
    it 'creates and returns a single location object', :vcr do
      location = "denver, co"
      location_object  = LocationFacade.get_lat_long(location)
      expect(location_object).to be_an_instance_of(Location)
    end
  end
end
