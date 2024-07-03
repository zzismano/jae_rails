class AddScheduleToLeisures < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :schedule, :string
  end
end
