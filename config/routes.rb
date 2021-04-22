Rails
  .application
  .routes
  .draw do
    root to: 'links#index'

    devise_for :users

    resources :links do
      resources :comments
    end
    resources :channels
  end
