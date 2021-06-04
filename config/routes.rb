Rails.application.routes.draw do
  devise_for :admins
  resources :categories
  root to: 'home#index'
end
