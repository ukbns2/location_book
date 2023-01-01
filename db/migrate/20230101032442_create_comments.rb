class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :comment
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
