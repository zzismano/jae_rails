class AddTitleFiveToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :title_five, :string
  end
end
