Rails.application.routes.draw do
  root to: "home#index"
  get 'auth/google', as: 'google_login'
  get 'auth/:provider/callback', to: 'google_sessions#create'
  get 'login', to: 'sessions#new', as: 'signin'
  post 'login', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  patch "/increase", to: 'cart#increase'
  patch "/decrease", to: 'cart#decrease'
  resources :accessories, only: [:index]
  resources :bikes, only: [:index]
  resources :categories, only: [:index]
  resources :cart, only: [:create, :index, :destroy]
  resources :dashboard, only: [:show]
  resource :home, only: [:show]
  resources :items
  resources :lessons, only: [:index]
  resources :tools, only: [:index]
  resources :sessions, only: [:create, :destroy]
  resources :stations
  resources :trips
  resource :users, except: [:show]
end
