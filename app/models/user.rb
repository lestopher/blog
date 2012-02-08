class User < ActiveRecord::Base
  has_many :posts
  validates_presences_of :name
end