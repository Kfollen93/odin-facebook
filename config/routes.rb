Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  devise_for :users
  resources :friend_requests, :friendships

resources :users, only: [:index, :show, :edit, :update] do 
  member do
    delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
  end
end

  root 'users#welcome'
end