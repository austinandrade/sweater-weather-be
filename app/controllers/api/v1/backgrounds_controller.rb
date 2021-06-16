class Api::V1::BackgroundsController < ApplicationController
  def show
    if params[:location].present?
      image = BackgroundsFacade.get_photo(params[:location])
      if image.nil?
        render json: { errors: 'No images found with that location. Please try again.' }.to_json, status: :not_found
      else
        render json: ImageSerializer.new(image)
      end
    else
      render json: { errors: 'Please include location param' }.to_json, status: :bad_request
    end
  end
end
