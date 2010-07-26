ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'videos', :action => 'new'
  map.resources :videos
end
