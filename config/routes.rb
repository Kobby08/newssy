Rails.application.routes.draw do
      

    root to: 'links#index'
    mount Notifications::Engine => "/notifications"
    devise_for :users

    resources :links do
      resources :comments
      put :like, on: :member
      put :dislike, on: :member
    end
    resources :channels do
      resources :subscriptions, only: %i[index create destroy]
    end
    resources :categories
  end
