class RemoveVenueFromLeisure < ActiveRecord::Migration[7.1]
  def change
    remove_reference :leisures, :venue, null: false, foreign_key: true
  end
end
