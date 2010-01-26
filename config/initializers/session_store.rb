# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_panda_example_rails_walkthrough_session',
  :secret      => '771574ec8803f8c2b92003bd08939051e5b5aeadc17f0a3415a2497486a31bdd71430026e5797e8bec5034c167862351af62363c32f1460cfe945108588932c7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
