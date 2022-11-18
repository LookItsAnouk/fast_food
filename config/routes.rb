Rails.application.routes.draw do
  root "welcome#index"

  #resources :user_signed_in
  resources :users
  resource :session, only: [:new, :destroy, :create]

 
  resources :orders
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'users/:id/dashboard', to: 'users#dashboard', as: :dashboard_user

  get 'search', to: 'searches#show'

end
