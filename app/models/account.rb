class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :user

  # Return user record if authentication is valid,
  # else return the standard value of false
  def authenticate(password)
    super(password) ? self.user : false
  end
end
