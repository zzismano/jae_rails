class ChangeDurationInLeisure < ActiveRecord::Migration[7.1]
  def change
    change_column :leisures, :duration, :string
  end
end
