APP_CONFIG = YAML::load(File.open(File.join(File.dirname(__FILE__),'..', 'panda.yml')))[RAILS_ENV]
PANDA = Panda.connect!(APP_CONFIG['panda'])
S3_CONFIG = APP_CONFIG['s3']