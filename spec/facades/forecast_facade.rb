require "rails_helper"

describe 'ForecastFacade' do
  it 'exists' do
    forecast_facade = ForecastFacade.new
    expect(forecast_facade).to be_an_instance_of(ForecastFacade)
  end

  describe '#get_forecast' do
    it 'creates and returns a Forecast object', :vcr do
      latitude  = 39.738453
      longitude = -104.984853
      forecast  = ForecastFacade.get_forecast(latitude, longitude)
      expect(forecast).to be_an_instance_of(Forecast)
    end
  end
end
