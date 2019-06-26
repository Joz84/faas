Rails.application.routes.draw do
  devise_for :users
  root to: 'users#dashboard'
  get '/fouss', to: "users#fouss"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :choices, only: [:update]
  resources :battles, only: [:create]
  resources :activities, only: [:create]
  resources :events, only: [:create]
end
