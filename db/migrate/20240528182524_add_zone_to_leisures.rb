class AddZoneToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :zone, :string
  end
end
