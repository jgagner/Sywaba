# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sywaba_session',
  :secret      => 'd8dea16cbd2335b2d3754c3af5dc3d5b1b8d578b4bbb3fa6dfcb4165c8e974c8f5662478946aaf7182ab3a941c03fd396751f191a7d3f6f730050f7b30e71412'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
