Rails.application.routes.draw do
  resources :lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'hello_world', to: 'hello_world#index'
  resources :favourites
  resources :venues
  resources :votes
  resources :reviews
  resources :searches
  resources :performances
  resources :events
  resources :comments
  resources :comment_vote

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'search' => 'search#index' 
  get 'search/results' => 'search#do_search' 

  root 'home#index'

  get '/events/:id/comments' => 'events#comments'
  get '/events/:id/is_favourited' => 'events#is_favourited'
  get '/admin/panel' => 'admin#panel'
  get '/events/:id/votes' => 'events#votes'
  get '/events/:id/performances' => 'events#performances'
  get '/events/:id/reviews' => 'events#reviews'

  post '/lists/swap_items' => 'lists#swap_items'
  post '/lists/create_item' => 'lists#create_item'
  post '/lists/destroy_item' => 'lists#destroy_item'

  # resources :search
  devise_for :users, controllers: { sessions: 'users/sessions' }

end
