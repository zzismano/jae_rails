class AddHideDateToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :hide_date, :date
  end
end
