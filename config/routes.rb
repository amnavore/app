Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"
  get '/login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#logout', as: 'logout'
  get '/auth/github', as: 'github_auth'
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
  resources :restaurants
end
