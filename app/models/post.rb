class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :post_title, :post, :user_id
end