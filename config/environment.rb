# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config| 
  config.gem "panda", :source => "http://gemcutter.org"
  config.gem "rspec-rails", :lib => "spec"
  config.time_zone = 'UTC'
  
  config.frameworks -= [ :active_record]
  
end

PANDA_CONFIG = YAML::load(File.open(File.join(File.dirname(__FILE__), 'panda.yml')))[RAILS_ENV]
Panda.connect!(PANDA_CONFIG)

VIDEOS_PATH_PREFIX = "http://s3.amazonaws.com/panda-test-videos"