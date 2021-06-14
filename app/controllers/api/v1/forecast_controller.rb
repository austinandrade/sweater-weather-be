class Api::V1::ForecastController < ApplicationController
  def show
    location_coordinates = LocationFacade.get_lat_long(params[:location])
    forecast = ForecastFacade.get_forecast(location_coordinates.latitude, location_coordinates.longitude)
    render json: ForecastSerializer.new(forecast)
  end
end
