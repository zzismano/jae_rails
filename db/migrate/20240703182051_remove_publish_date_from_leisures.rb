class RemovePublishDateFromLeisures < ActiveRecord::Migration[7.1]
  def change
    remove_column :leisures, :publish_date, :date
  end
end
