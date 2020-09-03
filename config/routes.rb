Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :search, only: [:index]

  resources :users, only: [:index, :show, :new, :create]
  resources :posts, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :friendrequests, only: [:create, :destroy, :show]
  resources :notices, only: [:create, :show]
  resources :rooms, only: [:index, :show, :create]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
