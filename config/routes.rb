Rails.application.routes.draw do
  devise_for :users

  resources :photo_images
  resources :cities
  resources :cities
  resources :albums
  resources :users do
    resources :albums do
      resources :photo_images
    end
  end
  post '/rate' => 'rater#create', :as => 'rate'
  
  resources :articles
  
  get 'users(/:id)' => 'users#show'

  root 'articles#index'
end
