class AddPriceToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :price, :decimal, precision: 8, scale: 2
  end
end
