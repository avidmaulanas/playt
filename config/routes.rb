Rails.application.routes.draw do
  resources :playlists
  root 'home#index'

  resources :videos, only: [:index, :show, :create, :destroy] do
    collection do
      get 'playback', to: "videos#playback"
    end
  end

  resource :user, only: [:show, :edit, :update] do
    get 'password' => 'users#password'
    collection do
      patch 'password/update' => 'users#update_password'
    end
  end

  devise_for :users, skip: [:sessions] #, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    delete 'signup' => 'users/sessions#destroy', as: :destroy_user_session
  end

  get 'plans', to: 'subscriptions#plans'
  post 'subscription_checkout', to: 'subscriptions#subscription_checkout'
end
