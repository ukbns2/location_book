class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :postal_code
      t.string :address
      t.float :rate
      t.text :body
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
