Rails.application.routes.draw do
  root "welcome#index"

  #resources :user_signed_in
  resources :users do
    resources :cooks
  end

  resource :session, only: [:new, :destroy, :create]

  resources :recipes do
    resources :reviews, only: [:create, :destroy]
    resources :orders, only: [:create, :destroy]
  end

  resources :ratings
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'users/:id/dashboard', to: 'users#dashboard', as: :dashboard_user

  get 'search', to: 'searches#show'

end
