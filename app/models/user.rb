class User < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates_presence_of :fname, :lname, :username, :password, :on => :create
  validates_uniqueness_of :username
end