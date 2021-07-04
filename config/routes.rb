Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get "/home/top/", to: "homes#top"
  get "/home/about/", to: "homes#about"
  get "/home/timer/", to: "homes#timer"

  resources :menus
  resources :relationships
  resources :training_contents
  resources :trainings
  resources :user_dates
  resources :users, only: [:show, :edit, :update]


end
