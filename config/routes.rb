ActionController::Routing::Routes.draw do |map|
  # Authlogic support
  map.resource :account, :controller => 'users'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'


  # Standard routes
  map.resources :user_sessions
  map.resources :people,    :collection => { :autocomplete => :get}
  map.resources :incidents, :collection => { :autocomplete => :get}
  map.resources :vehicles,  :collection => { :autocomplete => :get}
  map.resources :reports,   :collection => { :autocomplete => :get}
  map.resources :admin

  # By default, we want the user to see this page.
  map.root :controller => 'incidents', :action => 'redirect'
end
