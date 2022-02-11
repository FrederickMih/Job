Rails.application.routes.draw do
  resources :campaigns
  resources :profiles
  # resources :compaigns
  get 'users/payment'

  root to: "home#index"
  get "dashboard", to: "dashboard#index"
  get "agents", to: "home#agents"
  devise_for :users

  resources :users do
    get :payment
  end
end
