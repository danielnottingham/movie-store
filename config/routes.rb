Rails.application.routes.draw do
  devise_for :users
  get 'movies/index'
  get 'movies/new'
  get 'movies/create'
  get 'movies/edit'
  get 'movies/show'
  get 'movies/update'
  get 'movies/destroy'
  devise_for :admins
  resources :categories
  resources :movies
  root to: 'home#index'
end
