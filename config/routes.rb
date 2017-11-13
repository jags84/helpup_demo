Rails.application.routes.draw do
  devise_for :users
  resources :albums, only: [:index,:show,:create,:update]
  resources :albums do
    resources :pictures, only: [:create,:destroy]
  end

  root to: 'home#index'
end
