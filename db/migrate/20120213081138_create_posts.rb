class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :post_title
      t.binary :post
      t.integer :user_id
      
      t.timestamps
    end
  end
  
  def down
    drop_table :posts
  end
end
