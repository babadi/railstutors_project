class User < ActiveRecord::Base
  attr_accessible :password, :username
  validates :username, presence: true
  has_many :posts
  has_many :comments
  has_secure_password
end
