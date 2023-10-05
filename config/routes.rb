Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      	get "followings" => "relationships#followings", as: "followings"
      	get "followers" => "relationships#followers", as: "followers"
  end 
  root to: "homes#top"
  get '/home/about' => "homes#about", as: "homeabout"
  get "/search", to: "searches#search"
end
