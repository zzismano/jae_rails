class AddTitleTwoToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :title_two, :string
  end
end
