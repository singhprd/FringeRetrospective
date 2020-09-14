# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "hello_world", to: "hello_world#index"
  resources :favourites
  resources :venues
  resources :votes
  resources :reviews
  resources :searches
  resources :performances
  resources :events
  resources :comments
  resources :comment_vote
  resources :list_items
  resources :friends
  resources :friend_requests

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "search" => "search#index"
  get "search/results" => "search#do_search"

  root to: redirect('/home/2019')

  get "/events/:id/comments" => "events#comments"
  get "/events/:id/is_favourited" => "events#is_favourited"
  get "/admin/panel" => "admin#panel"
  get "/events/:id/votes" => "events#votes"
  get "/events/:id/performances" => "events#performances"
  get "/events/:id/reviews" => "events#reviews"

  post "/lists/swap_items" => "lists#swap_items"
  post "/lists/create_item" => "lists#create_item"
  post "/lists/destroy_item" => "lists#destroy_item"

  get "/home/search" => "home#search", as: "home_page_search"

  # resources :search
  devise_for :users, controllers: {
    sessions: "users/sessions", invitations: 'users/invitations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  get "home/:year" => "home#events", :constraints => { year: /\d{4}/ }

  resources :credentials, only: [:create, :destroy] do
    post :callback, on: :collection
  end

  resource :webauthn_registration, only: [:new, :create] do
    post :callback
  end

  resources :credentials, only: [:create, :destroy] do
    post :callback, on: :collection
  end

  resource :webauthn_session, only: [:new, :create, :destroy] do
    post :callback
  end

end
