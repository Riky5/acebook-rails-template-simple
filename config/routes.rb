# frozen_string_literal: true

Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'homepage#index', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "posts#index"
  
  get '/posts', to: 'posts#index'
  
  resources :posts do
    resources :comments
  end
  
  resources :posts do
    resources :likes
  end
  
  resources :friend_requests
end
