class User < ActiveRecord::Base
  # gives User model authentification methods via bcrypt
  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    if (email && password)
      @user = User.find_by(email: email)&.authenticate(password)
      
      if (@user)
        @user
      else
        nil
      end
    end
  end
end
