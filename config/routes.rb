Rails.application.routes.draw do
  resources :albums
  post '/rate' => 'rater#create', :as => 'rate'

  devise_for :users
  resources :articles
  
  get 'persons(/:id)' => 'persons#show', as: 'person'

  root 'articles#index'
end
