Rails.application.routes.draw do
  root to: "home#index"
  get 'auth/google', as: 'google_login'
  get 'auth/:provider/callback', to: 'google_sessions#create'
  get 'login', to: 'sessions#new', as: 'signin'
  post 'login', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :categories, only: [:index]
  resources :bikes, only: [:index]
  resources :accessories, only: [:index]
  resources :tools, only: [:index]
  resources :lessons, only: [:index]
  resources :cart, only: [:create, :index, :destroy]
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :dashboard, only: [:show]

  resource :users, except: [:show]



  resources :items
end
