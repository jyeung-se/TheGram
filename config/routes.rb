Rails.application.routes.draw do
  resources :posts
  resources :comments
  resources :likes
  resources :users#, only: [:new, :create, :show, :edit, :update]

  get '/users/:id/followers', to: 'users#followers', as: 'followers'
  get '/users/:id/following', to: 'users#following', as: 'following'

  get "signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "sessions", to: "sessions#destroy", as: "logout"

  # post '/posts/', to: 'posts#like', as: 'likes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
