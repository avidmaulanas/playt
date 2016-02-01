Rails.application.routes.draw do
  resources :playlists
  root 'home#index'

  resources :videos, only: [:index, :create, :destroy] do
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
    get 'asup' => 'devise/sessions#new', as: :new_user_session
    post 'asup' => 'devise/sessions#create', as: :user_session
    delete 'kaluar' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
