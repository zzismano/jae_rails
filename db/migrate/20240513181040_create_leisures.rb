class CreateLeisures < ActiveRecord::Migration[7.1]
  def change
    create_table :leisures do |t|
      t.references :category, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.string :picture
      t.string :link
      t.string :title
      t.string :subtitle
      t.string :director
      t.string :country
      t.text :description
      t.string :features
      t.integer :min_age
      t.integer :duration
      t.time :time
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
