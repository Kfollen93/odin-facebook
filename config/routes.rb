Rails.application.routes.draw do
devise_for :users
resources :posts do
   resources :comments
end

resources :users, only: [:index, :show, :edit, :update] do 
  member do
    delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
  end
end

root 'users#welcome'
end