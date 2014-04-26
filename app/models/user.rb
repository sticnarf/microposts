class User < ActiveRecord::Base
  NAME_MAX_LENGTH = 50

  validates :name, :email, presence: true
  validates :name, :length => { maximum: NAME_MAX_LENGTH }
  validates :email, :format => { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, :uniqueness => { case_sensitive: false }
  validates :password, :length => { minimum: 6 }

  has_secure_password

  before_save { self.email = email.downcase }
end
