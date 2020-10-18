Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :youtubers, only: [:index]
  get 'youtuber/form', to: 'youtubers#form'
  get 'youtuber/search', to: 'youtubers#search'

  resources :search, only: [:index]
  get 'search/form', to: 'search#top'

  get 'users/look', to: 'users#look'
  resources :users, only: [:show, :new, :create, :edit, :update]

  resources :posts, only: [:show, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :friendrequests, only: [:index, :show, :create, :destroy]
  resources :notices, only: [:index, :create, :destroy]
  resources :rooms, only: [:index, :show, :create]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :messages, only: [:create]
  
end
