Rails.application.routes.draw do
  devise_for :users
  resources :albums, only: [:index,:show,:create]
  root to: 'home#index'
end
