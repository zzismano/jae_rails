class AddLinkThreeToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :link_three, :string
  end
end
