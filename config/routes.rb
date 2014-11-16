Rails.application.routes.draw do
  resources :posts

  root to: 'sessions#login'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
