class User < ActiveRecord::Base
  # gives User model authentification methods via bcrypt
  has_secure_password
end
