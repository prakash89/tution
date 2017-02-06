Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :events
    resources :documents
    get '/documents/download/:id' => 'documents#download', :as => :download
    resources :employee_requests
    resources :workshop_requests
    resources :apply_tutions
    get '/compitative_requests' => 'apply_tutions#com_index', :as => :compitative_requests

    get '/user_events' => 'events#user_index', :as => :user_events
    get '/admin' => 'admin#index', :as => :admin
    get '/get_all_users' => 'custom_admin#get_all_users', :as => :get_all_users
    get '/users' => 'users#index', :as => :get_users
    get '/users/:id' => 'users#show', :as => :users_show
    delete '/users/:id' => 'users#destroy', :as => :users_delete

    get 'contact', to: 'messages#new', as: 'contact'
    post 'contact', to: 'messages#create'

    resources :billings do
      collection do
        get 'manager_index'
      end
    end

    get 'billings/:id/invoice', to: 'billings#invoice', :as => :invoice
    get 'billings/:id/pdf_output', to: 'billings#pdf_output', :as => :pdf_output
    get 'billings/:id/pdf_download', to: 'billings#pdf_download', :as => :pdf_download

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
