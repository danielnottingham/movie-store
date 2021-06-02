Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/create'
  devise_for :admins
  resources :categories, only: %i[index new create show]
  root to: 'home#index'
end
