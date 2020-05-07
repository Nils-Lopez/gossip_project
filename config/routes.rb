Rails.application.routes.draw do
  get '/', to: "gossips#index"
  resources :gossips
  resources :users
  resources :cities
  resources :session, only: [:new, :create, :destroy]
  resources :contact, only: [:index]
  resources :team, only: [:index]
end
