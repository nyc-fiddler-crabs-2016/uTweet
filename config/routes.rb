Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tweets, only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
