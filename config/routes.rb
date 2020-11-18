Rails.application.routes.draw do
  devise_for :users
  resources :friend_requests, :friendships

resources :users do 
  member do
    delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
  end
end

  root 'users#welcome'
end