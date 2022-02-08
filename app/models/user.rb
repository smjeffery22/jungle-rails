class User < ActiveRecord::Base
  # gives User model authentification methods via bcrypt
  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
