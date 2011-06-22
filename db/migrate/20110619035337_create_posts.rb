class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id, :null => false
      t.string  :title, :null => false, :limit => 256
      t.string  :content

      t.timestamps
    end

    add_index :posts, :user_id, :name => "idx_posts_by_user"
  end

  def self.down
    drop_table :posts
  end
end
