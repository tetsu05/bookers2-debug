Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resources :homes
  get 'home/about' => 'homes#about'
  
end