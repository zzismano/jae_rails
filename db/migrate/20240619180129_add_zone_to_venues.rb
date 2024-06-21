class AddZoneToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :zone, :string
  end
end
