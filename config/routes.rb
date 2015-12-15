Rails.application.routes.draw do

  post 'cart/create_charge' => 'cart#create_charge', :as => :create_charge
  post '/cart/create_address' => 'cart#create_address', :as => :create_address
  get '/cart/place_order' => 'cart#place_order', :as => :place_order
  get '/cart/checkout' => 'cart#checkout', :as => :checkout
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clear_cart', :as => :clear_cart
  get '/cart/:id' => 'cart#add'
  post '/cart/set_quantity' => 'cart#set_quantity'

  get 'store/:id' => 'store#show', :as => :store_product

  get 'login'   => 'user_sessions#new'
  get 'logout'  => 'user_sessions#destroy'

  get 'home/index', :as => :home
  get 'products/:id' => 'home#show', :as => :show_product

  resources :user_sessions, only: [:new, :create]
  
  post 'sign_up' => 'registration#create'
  get 'sign_up' => 'registration#new'
  

  scope :admin do
    get '' => 'admin#index'
    resources :products do
      resources :product_variants
    end
    resources :users
    resources :categories
    resources :brands
    resources :colors
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
