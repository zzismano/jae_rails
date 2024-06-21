class RemoveZoneFromLeisures < ActiveRecord::Migration[7.1]
  def change
    remove_column :leisures, :zone, :string
  end
end
