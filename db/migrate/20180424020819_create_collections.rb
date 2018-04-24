class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.integer :manga_id
      t.text :review
      t.integer :rating
      t.string :status
      t.integer :last_read

      t.timestamps
    end
  end
end
