Rails.application.routes.draw do
  resources :filiks

  resources :words do
    get 'get_list', on: :collection
  end

  resources :posts

  root to: 'sessions#login'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
