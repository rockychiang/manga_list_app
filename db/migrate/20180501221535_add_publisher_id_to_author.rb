class AddPublisherIdToAuthor < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :publisher_id, :integer
  end
end
