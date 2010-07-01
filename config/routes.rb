ActionController::Routing::Routes.draw do |map|

  # Authlogic support
  map.resource :account, :controller => 'users'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'


  # Standard routes
  map.resources :user_sessions
  map.resources :calls_for_service, :collection => { :search => :get}
  map.resources :reports,           :collection => { :search => :get}
  map.resources :properties,        :collection => { :search => :get}
  map.resources :crime_analysis,    :collection => { :search => :get}
  map.resources :admin

  map.resources :people,          :collection => { :search => :get}
  map.resources :vehicles,        :collection => { :search => :get}
  map.resources :locations,       :collection => { :search => :get}
  

  # By default, we want the user to see this page.
  map.root :controller => 'reports', :action => 'redirect'

  # Route the Javascript views
  map.connect ':controller/:action.:format'
end
