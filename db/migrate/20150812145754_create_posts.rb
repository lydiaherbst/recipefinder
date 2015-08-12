class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.string :recipe
      t.string :ingredients
      t.belongs_to :user
    end
  end
  def down
    drop_table :posts
  end
end
