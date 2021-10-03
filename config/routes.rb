Rails.application.routes.draw do
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resources :homes
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
end