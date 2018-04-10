Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
  # get '/auth/google_oauth2/callback', to: 'sessions#create', as: "google_login"
  # get '/auth/google_oauth2', to: 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root to: "home#index"
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
end
