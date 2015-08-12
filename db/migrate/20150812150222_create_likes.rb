class CreateLikes < ActiveRecord::Migration
  def up
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :post
    end
  end
  def down
    drop_table :likes
  end
end
