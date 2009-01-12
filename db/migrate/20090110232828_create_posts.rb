class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :image
      t.string :thumb

      t.text :description
      
      t.integer :flickr_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
