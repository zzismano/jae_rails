class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :leisure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
