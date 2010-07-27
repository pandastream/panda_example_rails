panda_config = YAML::load_file(File.join(File.dirname(__FILE__),"..", "panda.yml"))[RAILS_ENV]
Panda.configure panda_config