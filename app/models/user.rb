class User < ActiveRecord::Base
  NAME_MAX_LENGTH = 50
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :email, presence: true
  validates :name, :length => { maximum: NAME_MAX_LENGTH }
  validates :email, :format => { with: EMAIL_REGEXP }
  validates :email, :uniqueness => { case_sensitive: false }
  validates :password, :length => { minimum: 6 }

  has_secure_password

  before_save { email.downcase! }
end
