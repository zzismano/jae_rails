class CreateSectionCards < ActiveRecord::Migration[7.1]
  def change
    create_table :section_cards do |t|
      t.references :card, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
