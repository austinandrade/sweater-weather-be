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

  describe '#get_road_trip' do
    describe 'happy path' do
      it 'creates and returns a single roadtrip object', :vcr do
        start_city      = 'Cleveland, OH'
        end_city        = 'Denver, CO'
        forecast_object = Forecast.new(current_weather_data)
        roadtrip_object = LocationFacade.get_road_trip(start_city, end_city, forecast_object)
        expect(roadtrip_object).to be_an_instance_of(Roadtrip)
      end
    end

    describe 'sad path' do
      it 'creates and returns a single roadtrip object with impossible travel time and empty weather', :vcr do
        start_city = 'Cleveland, OH'
        end_city   = 'London, UK'
        roadtrip_object  = LocationFacade.get_road_trip(start_city, end_city, bad_location_data)
        expect(roadtrip_object).to be_an_instance_of(Roadtrip)

        expect(roadtrip_object.travel_time).to eq("impossible")
        expect(roadtrip_object.weather_at_eta).to eq({})
        expect(roadtrip_object.weather_at_eta.empty?).to eq(true)
      end
    end
  end
end
