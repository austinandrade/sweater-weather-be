class Api::V1::SessionsController < ApplicationController
  def create
    user_info = JSON.parse(request.raw_post, symbolize_names: true)
    user = User.find_by(email: user_info[:email])
    if user && user.authenticate(user_info[:password])
      render json: UsersSerializer.new(user)
    else
      render json: { errors: 'Incorrect username or password. Please try again.', status: 400 }, status: :bad_request
    end
  end
end
