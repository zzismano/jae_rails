class AddPublishDateToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :publish_date, :date
  end
end
