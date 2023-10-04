Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end 
  resources :users, only: [:show, :edit, :index, :update]
  root to: "homes#top"
  get '/home/about' => "homes#about", as: "homeabout"
end
