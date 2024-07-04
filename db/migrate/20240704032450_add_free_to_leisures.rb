class AddFreeToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :free, :boolean
  end
end
