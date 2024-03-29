MassTriage::Application.routes.draw do
 
  
  
  resources :incident_types

  match "login", :to => "user_sessions#new", :as => :login
  
  match "logout", :to => "user_sessions#destroy", :as => :logout

  match "patients/other", :to => "patients#other"
  
  match "administrators/index"  => "administrators#index", :as => "administrators"
  
  match "join_incident", :to => "incidents#join_incident", :as => :join_incident

  resources :user_sessions

  resources :users

  resources :hospitals

  

  resources :responders

  match "incidents/:id/closeincident" => "incidents#closeincident", :as => "closeincident"
  match "incidents/:incident_id/viewupdate" => "incidents#viewupdate", :as => "viewupdate"
  match "incidents/:incident_id/resourceupdate" => "incidents#resourceupdate", :as => "resourceupdate"
  match "incidents/:incident_id/patient_count" => "incidents#patient_count", :as => "patient_count"
  match "incidents/report" => "incidents#report", :as => "report"
  match "viewreport/:id" => "incidents#viewreport", :as => "viewreport"
  
  resources :incidents do
    resources :ambulances
    resources :patients
    member do
      get 'close'
    end
    
  end

 
  
  root :to => 'incidents#index'

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
