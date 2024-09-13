class AddLinkTwoToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :link_two, :string
  end
end
