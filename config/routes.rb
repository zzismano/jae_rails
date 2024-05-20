Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "leisures#index"
  #admin routes
  get "dashboard", to: "leisures#dashboard"
  #Leisures routes
  resources :leisures, only: %i[new create edit update destroy]
  #Categories routes
  resources :categories, only: %i[new create edit update]
  #Venues routes
  resources :venues, only: %i[new create edit update]
  #Genres routes
  resources :genres, only: %i[new create edit update]
end
