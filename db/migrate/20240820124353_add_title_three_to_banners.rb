class AddTitleThreeToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :title_three, :string
  end
end
