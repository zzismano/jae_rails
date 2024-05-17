class RemovePictureFromLeisure < ActiveRecord::Migration[7.1]
  def change
    remove_column :leisures, :picture, :string
  end
end
