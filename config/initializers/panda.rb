if ['production'].include?(RAILS_ENV)
  # if our application is deployed to heroku
  # we fetch variables from you environment
  PANDA_CONFIG = {
     "access_key"  =>  ENV['PANDASTREAM_ACCESS_KEY'],
     "secret_key"  =>  ENV['PANDASTREAM_SECRET_KEY'],
     "cloud_id"    =>  ENV['PANDASTREAM_CLOUD_ID'],
     "api_host"    =>  ENV['PANDASTREAM_API_HOST'],
     "api_port"    =>  ENV['PANDASTREAM_API_PORT']
   }
else
  PANDA_CONFIG = YAML::load(File.open(File.join(File.dirname(__FILE__),'..', 'panda.yml')))[RAILS_ENV]
end

PANDA = Panda.new(PANDA_CONFIG)