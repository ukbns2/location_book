class AddStatusToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :status, :boolean, default: false
  end
end
