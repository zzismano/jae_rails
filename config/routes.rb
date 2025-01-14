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
  get "about_us", to: "leisures#about_us"
  #Leisures routes
  resources :leisure_genres, only: %i[destroy]
  resources :leisure_venues, only: %i[destroy]

  resources :leisures, only: %i[index new create edit show update destroy] do
    resources :leisure_genres, only: %i[new create]
    resources :leisure_venues, only: %i[new create destroy]
  end
  #Categories routes
  resources :categories, only: %i[index new create edit update]
  #Venues routes
  resources :venues, only: %i[index new create edit update destroy]
  #Genres routes
  resources :genres, only: %i[index new create edit update destroy]

  resources :banners

  resources :cards

  resources :sections, only: [:create, :destroy, :edit, :update] do
    resources :section_cards, only: [:edit, :update]
  end

  resources :section_cards, only: [:destroy, :create]

  resources :subcategories, only: [:index]

  get "filme", to: 'leisures#filme'
  get "teatro", to: 'leisures#teatro'
  get "musica", to: 'leisures#musica'
  get "danca", to: 'leisures#danca'
  get "evento", to: 'leisures#evento'
  get "festa", to: 'leisures#festa'
  get "expo", to: 'leisures#expo'
  get 'mais', to: 'leisures#mais'


  get "banner_config", to: 'banners#banner_config'

  get 'card_config', to: 'cards#card_config'

  get 'section_config', to: "sections#section_config"

  post 'newsletter_subscription', to: 'leisures#newsletter_subscription'



end
