Rails.application.routes.draw do
  resources :posts
  resources :comments
  resources :likes
  resources :users

  get '/users/:id/followers', to: 'users#followers', as: 'followers'
  get '/users/:id/following', to: 'users#following', as: 'following'

  post '/posts/', to: 'posts#like', as: 'likes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
