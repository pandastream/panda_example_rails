PandaExampleRails::Application.routes.draw do
  resources :videos
  root :to => "videos#new"
end
