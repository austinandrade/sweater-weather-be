Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get  '/forecast',    to: 'forecast#show'
      get  '/backgrounds', to: 'backgrounds#show'
      post '/users',       to: 'users#create'
      post '/sessions',    to: 'sessions#create'
      post '/road_trip',   to: 'roadtrip#create'
    end
  end
end
