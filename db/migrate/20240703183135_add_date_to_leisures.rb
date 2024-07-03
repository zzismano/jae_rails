class AddDateToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :date, :string
  end
end
