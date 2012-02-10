class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :post_title, :post, :create_date, :user_id
end