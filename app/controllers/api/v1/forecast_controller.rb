class Api::V1::ForecastController < ApplicationController
  def show
    if params[:location]
      location_coordinates = LocationFacade.get_lat_long(params[:location])
      forecast = ForecastFacade.get_forecast(location_coordinates.latitude, location_coordinates.longitude)
      render json: ForecastSerializer.new(forecast)
    else
      render json: { error: 'Please include location param' }.to_json, status: :bad_request
    end
  end
end
