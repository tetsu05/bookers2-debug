Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  resources :homes
  get 'home/about' => 'homes#about'
  resources :users, only:[:index, :show, :edit, :update] do
  member do
    get :follows, :followers
  end
  resource :relationships, only: [:create, :destroy]
  end
  
  get "search" => "searches#search"
  
end