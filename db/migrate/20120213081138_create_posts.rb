class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_title
      t.blob :post
      t.integer :user_id
      t.date    :create_date
      t.timestamps
    end
  end
end
