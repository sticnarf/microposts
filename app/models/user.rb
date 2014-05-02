class User < ActiveRecord::Base
  include Gravtastic

  NAME_MAX_LENGTH = 50
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :email, presence: true
  validates :name, :length => { maximum: NAME_MAX_LENGTH }
  validates :email, :format => { with: EMAIL_REGEXP }
  validates :email, :uniqueness => { case_sensitive: false }
  validates :password, presence: true, :length => { minimum: 6 }
  validates :password_confirmation, presence: true

  has_secure_password
  gravtastic

  before_save { email.downcase! }
end
