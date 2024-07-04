class RemoveTimeFromLeisures < ActiveRecord::Migration[7.1]
  def change
    remove_column :leisures, :time, :time
  end
end
