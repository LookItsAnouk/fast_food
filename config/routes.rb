Rails.application.routes.draw do
  devise_for :users
  resources :users, :except => [:create]
  resources :orders
  # resources :users
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"



end
