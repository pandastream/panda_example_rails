PANDA_CONFIG = YAML::load(File.open(File.join(File.dirname(__FILE__),'..', 'panda.yml')))[RAILS_ENV]
PANDA = Panda.new(PANDA_CONFIG)