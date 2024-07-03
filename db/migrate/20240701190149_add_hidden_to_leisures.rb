class AddHiddenToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :hidden, :boolean
  end
end
