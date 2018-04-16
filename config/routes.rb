Rails.application.routes.draw do
  get 'auth/google', as: 'google_login'
  get 'auth/:provider/callback', to: 'google_sessions#create'
  get 'login', to: 'sessions#create', as: 'signin'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root to: "home#index"

  resources :categories, only: [:index] do
  end
  get "/bikes", to: "items#index"
    get "/accessories", to: "items#index"
      get "/tools", to: "items#index"
        get "/lessons", to: "items#index"
  resources :carts, only: [:create]

  resources :sessions, only: [:create, :destroy]

  resource :home, only: [:show]

  resource :users

   get "/cart", to: "carts#index"

    resources :items, only: [:index, :new, :destroy, :edit, :update, :create, :show]
end
