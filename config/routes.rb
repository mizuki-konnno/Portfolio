Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get "/home/top/", to: "homes#top"
  get "/home/about/", to: "homes#about"
  get "/home/timer/", to: "homes#timer"

  resources :menus, only: [:new, :create, :destroy]
  resources :training_contents, only: [:new, :create, :destroy]
  resources :trainings, only: [:new, :index, :create, :show]
  resources :user_dates

  # フォロー機能する・外す 中間テーブルのためuserへネストする
  resources :users, only: [:index, :show, :edit, :update] do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'follwings'
  get 'followers' => 'relationships#followers', as: 'follwers'
  end

end
