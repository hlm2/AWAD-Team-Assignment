
RAILS_ENV = 'development'
require File.expand_path('../environment', __FILE__)

@users = User.new
@users.username = "admin"
@users.password = "adminpass"
@users.save
