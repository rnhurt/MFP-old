ActionController::Routing::Routes.draw do |map|
  # Authlogic support
  map.resource :account #, :controller => 'users'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'

  # Standard routes
  map.resources :people
  map.resources :incidents
  map.resources :vehicles
  map.resources :reports

  # By default, we want the user to see the "dashboard" page.
  map.root :controller => "people"
end
