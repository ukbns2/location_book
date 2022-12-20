class AddTagIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tag_id, :string
  end
end
