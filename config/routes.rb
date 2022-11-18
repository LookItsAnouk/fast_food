Rails.application.routes.draw do
  root "welcome#index"

  #resources :user_signed_in
  resources :users 
  resource :session, only: [:new, :destroy, :create]

  resources :recipes do
    resources :reviews, only: [:create, :destroy]
  end

  resources :orders, only: [:create, :destroy]

  resources :ratings
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'users/:id/dashboard', to: 'users#dashboard', as: :dashboard_user

  patch 'users/:id/review/:id/approve', to: 'users#approve', as: :approve

end
