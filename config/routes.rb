Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "leisures#home"
  #admin routes
  get "dashboard", to: "leisures#dashboard"
  #Leisures routes
  resources :leisure_genres, only: %i[destroy]
  resources :leisure_venues, only: %i[destroy]

  resources :leisures, only: %i[index new create edit update destroy] do
    resources :leisure_genres, only: %i[new create]
    resources :leisure_venues, only: %i[new create]
  end
  #Categories routes
  resources :categories, only: %i[index new create edit update]
  #Venues routes
  resources :venues, only: %i[index new create edit update]
  #Genres routes
  resources :genres, only: %i[index new create edit update]

  resources :banners

  resources :cards

  get "filme_filter", to: 'leisures#filme_filter'
  get "teatro_filter", to: 'leisures#teatro_filter'
  get "musica_filter", to: 'leisures#musica_filter'
  get "danca_filter", to: 'leisures#danca_filter'
  get "evento_filter", to: 'leisures#evento_filter'
  get "festa_filter", to: 'leisures#festa_filter'
  get "expo_filter", to: 'leisures#expo_filter'
  get "banner_config", to: 'banners#banner_config'

  get 'card_config', to: 'cards#card_config'
end
