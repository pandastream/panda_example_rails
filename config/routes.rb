ActionController::Routing::Routes.draw do |map|
  map.resources :videos
  map.root :controller => 'videos', :action => 'new'
end
