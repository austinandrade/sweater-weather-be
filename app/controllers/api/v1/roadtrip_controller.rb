class Api::V1::RoadtripController < ApplicationController
  def create
    trip_params = parse_body(request.raw_post)
    if trip_params[:origin] && trip_params[:destination] && trip_params[:api_key]
      if authorize(trip_params[:api_key])
        location_coordinates = LocationFacade.get_lat_long(trip_params[:destination])
        forecast = ForecastFacade.get_forecast(location_coordinates.latitude, location_coordinates.longitude)
        road_trip = LocationFacade.get_road_trip(trip_params[:origin], trip_params[:destination], forecast)
        render json: RoadtripSerializer.new(road_trip)
      else
        render json: { errors: 'Unauthorized! Please provide a valid api key.' }.to_json, status: 401
      end
    else
      render json: { errors: 'Please provide an origin, destination, and api key!' }.to_json, status: 400
    end
  end

  private

  def parse_body(raw_text)
    JSON.parse(raw_text, symbolize_names: true)
  end

  def authorize(received_key)
    User.find_by(api_key: received_key)
  end
end
