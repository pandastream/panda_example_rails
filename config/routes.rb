PandaExampleRails::Application.routes.draw do
  resources :videos

  match "/panda/authorize_upload", :to => "panda#authorize_upload"
  match "/panda/authorize_upload_postprocess", :to => "panda#authorize_upload_postprocess"

  match "/simple", :to => "videos#simple"

  match "/advanced", :to => "videos#advanced"

  match "/videos/postprocess", :to => "videos#postprocess"

  root :to => "videos#simple"

end
