class Api::V1::BookSearchController < ApplicationController
  def index
    location_coordinates = LocationFacade.get_lat_long(params[:location])
    current_forecast = ForecastFacade.get_forecast(location_coordinates.latitude, location_coordinates.longitude).current_weather
    found_books = BookSearchFacade.get_books(params[:location], params[:quantity], current_forecast)
    render json: BooksSerializer.new(found_books)
  end
end
