ContaktDemo::Application.routes.draw do

  resources :emails

  resources :faxes

  resources :phones

  resources :addresses, :only => [:destroy, :new, :create, :edit, :update] do
    post :thank_you, :on => :collection
  end
  resources :configurations, :only => [:edit, :update]
  
  root :to => "home#index"
  
  get '/:name' => 'addresses#index'
  get '/:name/address/:id' => 'addresses#show'
  post '/:name/thank_you' => 'addresses#thank_you'
  get '/home/dashboard' => 'home#show'
  get 'addresses#index' => "home#index"
  
  get '/addresses/subregion_options' => 'addresses#subregion_options'
  
  #devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
  devise_for :users, skip: :registrations, path_names: { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'register' },
      controller: 'devise/registrations',
      as: :user_registration do
      get :cancel
    end
  end
  
  
  resources :home do
    get :careers, :on => :collection
    get :product, :on => :collection
    get :about_us, :on => :collection
    get :faqs, :on => :collection
    get :contact_us, :on => :collection
    get :foo, :on => :collection
  end
  
  match "about_us" => "home#about_us"
  match "careers" => "home#careers"
  match "product" => "home#product"
  match "faqs" => "home#faqs"
  match "contact_us" => "home#contact_us"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
