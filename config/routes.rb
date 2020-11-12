Rails.application.routes.draw do
  devise_for :users

  resources :users, :friend_requests, :friendships
  root 'users#index'
end