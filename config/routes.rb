Rails.application.routes.draw do
  resources :story_genres
  resources :genres
  resources :comments
  resources :stories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'users#login'
  get '/initialFetch', to: 'users#initialFetch'
  post '/profile', to: 'users#show'
  delete '/remove_genre', to: 'story_genres#removeGenre'
end
