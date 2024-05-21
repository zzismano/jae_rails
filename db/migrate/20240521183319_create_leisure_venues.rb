class CreateLeisureVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :leisure_venues do |t|
      t.references :leisure, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
