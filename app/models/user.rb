class User < ActiveRecord::Base
  has_many :posts
  validates_presence_of :fname, :lname, :username
  validates_uniqueness_of :username
end