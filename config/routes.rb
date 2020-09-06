Rails.application.routes.draw do

  get 'messages/create'
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :youtubers, only: [:index]
  get 'youtuber/form', to: 'youtubers#form'
  get 'youtuber/search', to: 'youtubers#search'

  resources :search, only: [:index]

  get 'users/look', to: 'users#look'
  resources :users, only: [:index, :show, :new, :create]

  resources :posts, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :friendrequests, only: [:create, :destroy, :show]
  resources :notices, only: [:create, :show, :destroy]
  resources :rooms, only: [:index, :show, :create]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :messages, only: [:create]
  
end
