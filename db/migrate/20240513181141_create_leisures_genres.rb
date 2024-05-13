class CreateLeisuresGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :leisures_genres do |t|
      t.references :leisure, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
