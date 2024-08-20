class AddTitleOneToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :title_one, :string
  end
end
