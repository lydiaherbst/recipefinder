class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.string :message
    end
  end
  def down
    drop_table :comments
  end
end
