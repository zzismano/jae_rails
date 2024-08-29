class ChangeDatesToJsonbInLeisure < ActiveRecord::Migration[7.1]
  def up
    # Convert the column from json to jsonb
    change_column :leisures, :dates, :jsonb, using: 'dates::jsonb', default: []
  end

  def down
    # Convert the column back from jsonb to json
    change_column :leisures, :dates, :json, using: 'dates::json::text', default: []
  end
end
