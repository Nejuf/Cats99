require 'bcrypt'
require 'debugger'
class User < ActiveRecord::Base

  include BCrypt

  attr_accessible :user_name, :password, :session_token
  validates :user_name, :password_digest, :session_token, :presence => true
  validates :user_name, :uniqueness => true

  before_validation(on: :create) do
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)

    self.password_digest = Password.create(password)

  end

  # def password
  #   return password_digest
  # end

  def is_password?(password)
    obj = Password.new(self.password_digest)
    obj.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    return user if !!user && user.is_password?(password)
  end
end
