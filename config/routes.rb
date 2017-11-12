Rails.application.routes.draw do
  devise_for :users
  resources :albums, only: [:index,:show,:create]
  resources :pictures, only: [:create,:destroy]
  root to: 'home#index'
end
