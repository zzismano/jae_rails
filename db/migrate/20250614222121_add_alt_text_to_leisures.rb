class AddAltTextToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :alt_text, :string
  end
end
