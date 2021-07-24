Rails.application.routes.draw do
  # 新規登録後の偏移先を変えるためにcontrollerを作成し、controllers: { registrations: 'registrations' }を追記
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get "/home/top/", to: "homes#top"
  get "/home/about/", to: "homes#about"
  get "/home/timer/", to: "homes#timer"
  get "/home/date/", to: "homes#date"
  get "/home/home/", to: "homes#home"

  resources :menus, only: [:new, :create, :destroy]

  resources :trainings, only: [:new, :index, :create, :show] do
    resources :training_contents, only: [:new, :create, :destroy]
  end

  # フォロー機能する・外す 中間テーブルのためuserへネストする
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'follwings'
    get 'followers' => 'relationships#followers', as: 'follwers'
  end
end
