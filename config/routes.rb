Rails.application.routes.draw do
  root to: "home#index"
  get 'auth/google', as: 'google_login'
  get 'auth/:provider/callback', to: 'google_sessions#create'
  get 'login', to: 'sessions#new', as: 'signin'
  post 'login', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get "/bikes", to: "items#index"
    get "/accessories", to: "items#index"
      get "/tools", to: "items#index"
        get "/lessons", to: "items#index"
  resources :categories, only: [:index]
  resources :carts, only: [:create, :destroy, :index]
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resource :users
   get "/carts", to: "carts#index"
  resources :items, only: [:index, :new, :destroy, :edit, :update, :create, :show]
end
