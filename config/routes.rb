Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users
  resources :chats
  resources :messages
end

