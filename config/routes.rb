Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  resources :categories
  resources :movies do
    post 'disable', on: :member
    post 'active', on: :member
  end
  root to: 'home#index'
end
