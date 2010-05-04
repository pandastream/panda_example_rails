ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'application', :action => 'index'
  map.resources :videos
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
