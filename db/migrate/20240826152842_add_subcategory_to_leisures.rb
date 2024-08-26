class AddSubcategoryToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :subcategory_id, :bigint
  end
end
