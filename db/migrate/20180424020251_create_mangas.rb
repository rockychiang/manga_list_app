class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :status
      t.integer :volumes
      t.integer :chapters
      t.integer :author_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
