class Api::V1::BackgroundsController < ApplicationController
  def show
    if params[:location]
      image = BackgroundsFacade.get_photo(params[:location])
      render json: ImageSerializer.new(image)
    else
      render json: { error: 'Please include location param' }.to_json, status: 400
    end
  end
end
