Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :index, :update]
  root to: "homes#top"
  get '/home/about' => "homes#about", as: "homeabout"
end
