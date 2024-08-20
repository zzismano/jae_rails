class AddTitleFourToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :title_four, :string
  end
end
