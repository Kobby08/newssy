Rails
  .application
  .routes
  .draw do
    root to: 'links#index'

    devise_for :users

    resources :links
    resources :channels
  end
