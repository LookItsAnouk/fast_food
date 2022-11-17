Rails.application.routes.draw do

 
  resources :user_signed_in
  resources :users
  resource :session, only: [:new, :destroy, :create]

 
  resources :orders
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"



end
