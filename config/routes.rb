Rails.application.routes.draw do
  get 'dynamic/gossip'
  get 'dynamic/user'
  get 'dynamic/welcome'
  get '/team', to: "static#team"
  get '/contact', to: "static#contact"
  get '/index', to: "static#index"
  get '/', to: "static#index"
  get 'welcome/:first_name', to: "dynamic#welcome"
  get 'gossip/:id', to: "dynamic#gossip"
  get 'user/:id', to: "dynamic#user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
