# -*- encoding : utf-8 -*-
TweetBookOnRails::Application.routes.draw do
  
  post 'pusher/auth'
  
  get "sessions/new"

  get 'errores/error404'
  get 'errores/error500'
  get 'errores/raise500'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :microposts,    :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  
  root :to => 'pages#home'
  match '/prezi', :to => 'pages#prezi'
  match '/signup', :to => 'users#new' 
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/faq', :to => 'pages#faq'
  match '/profile', :to => 'users#show'
  match '/cuenta', :to => 'pages#cuenta'
  match '/help', :to => 'pages#help'
  match 'about', :to => 'pages#about'
  match '*not_found', :to => 'errores#error404'
  
  
    
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
