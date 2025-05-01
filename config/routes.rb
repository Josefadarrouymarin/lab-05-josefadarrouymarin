Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index, :show, :new, :create]
  resources :chats, only: [:index, :show, :new, :create]
  resources :messages, only: [:index, :show, :new, :create]
end

