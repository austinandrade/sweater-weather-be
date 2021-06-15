class Api::V1::BackgroundsController < ApplicationController
  def show
    if params[:location]
      image = BackgroundsFacade.get_photo(params[:location])
      if image.nil?
        render json: { error: 'No images found with that location. Please try again.' }.to_json, status: 404
      else
        render json: ImageSerializer.new(image)
      end
    else
      render json: { error: 'Please include location param' }.to_json, status: 400
    end
  end
end
