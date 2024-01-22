Rails.application.routes.draw do
  root to: "pages#about"
  get "/contact", to: "pages#contact"
  resources :restaurants

  # get "/restaurants", to: "restaurants#index"
  # get "/restaurants/new", to: "restaurants#new"
  # post "/restaurants", to: "restaurants#create"
  # get "/restaurants/:id/edit", to: "restaurants#edit"
  # get "/restaurants/:id", to: "restaurants#show", as: :show_restaurant
  # delete "restaurants/:id", to: "restaurants#destroy", as: :delete_restaurant
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
