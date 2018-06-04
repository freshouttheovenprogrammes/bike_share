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
  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    resources :orders, only: [:index]
  end
  resources :bikes, only: [:index]
  resources :categories, only: [:index]
  resources :cart, only: [:create, :index, :destroy]
  resources :conditions
  get '/dashboard', to: 'users#dashboard'
  resource  :home, only: [:show]
  resources :items
  resources :lessons, only: [:index]
  resources :sessions, only: [:create, :destroy]
  resources :stations
  resources :tools, only: [:index]
  resources :trips
  resources :users, except: [:show]
  namespace :user do
    resources :orders, except: [:new]
  end
end
