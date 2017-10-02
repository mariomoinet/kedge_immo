Rails.application.routes.draw do
  get 'rooms/new'

  get 'rooms/edit'

  get 'rooms/show'

  get 'rooms/create'

  get 'rooms/update'

  get 'rooms/index'

  get 'rooms/annonces'

  get '/your_trips' => 'reservations#your_trips'

  get '/your_reservations' => 'reservations#your_reservations'

  get 'pages/aidezmoi'

  get 'pages/charte'
  get 'pages/informations'
  get 'pages/conditions'
  devise_for :users,
              :path => '',
               :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
               :controllers =>{:registrations => 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'rooms#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :users, only: [:show]
  resources :rooms
  resources :rooms do
              resources :reservations, only: [:create]
              resources :reviews, only: [:create, :destroy]
   end

  resources :photos
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  resources :conversations, only: [:index, :create] do

         resources :messages, only: [:index, :create]

 end
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
