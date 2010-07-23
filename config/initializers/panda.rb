panda_config = YAML::load_file(File.join(File.dirname(__FILE__),"..", "panda.yml"))[RAILS_ENV]
Panda.configure do |config|
  config.api_host = panda_config["api_host"]
  config.access_key = panda_config["access_key"]
  config.secret_key = panda_config["secret_key"]
  config.cloud_id = panda_config["cloud_id"]
end 