Rails.application.routes.draw do

  namespace :admin, path: '/admin' do
    get 'dashboard/index'
    root to: redirect('admin/dashboard/index')
    resources :images
    resources :columns do
      resources :posts
    end
    resources :posts, except: [:show] do
      post :convert, on: :collection
    end
    resources :users
  end

  devise_for :users, controllers: { sessions: "users/sessions" }, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root 'posts#index'
  resources :posts, only: [:index, :show], param: :slug
  resources :users, only:[:show], param: :name
  resources :columns, only:[:show], param: :slug

  match '/tag/:tag' => 'tags#show', via: :get, as: :tag
  match '/site_map.:format' => 'posts#site_map', via: :get, constraints: { format: 'xml' }, as: :site_map

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
