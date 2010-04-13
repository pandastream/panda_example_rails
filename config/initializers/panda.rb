if ['production'].include?(RAILS_ENV)
  # if our application is deployed to heroku
  # we fetch variables from you environment
  PANDA_CONFIG = ENV['PANDASTREAM_URL']
else
  PANDA_CONFIG = YAML::load(File.open(File.join(File.dirname(__FILE__),'..', 'panda.yml')))[RAILS_ENV]
end

PANDA = Panda.new(PANDA_CONFIG)