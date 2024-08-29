class AddDatesToLeisure < ActiveRecord::Migration[7.1]
  def change
    add_column :leisures, :dates, :json
  end
end
