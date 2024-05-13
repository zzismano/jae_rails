class CreateVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.integer :capacity
      t.string :website

      t.timestamps
    end
  end
end
