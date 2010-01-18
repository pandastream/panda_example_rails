# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sushi_session',
  :secret      => 'c66914f97f95cf7bf3f420c8afa09dc07fd43e87a6a4f9da7d691fe51f1e2eeb3ecba0590b73e346862c641656367f8168ada7558138ae158b2bf815a18326bc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
