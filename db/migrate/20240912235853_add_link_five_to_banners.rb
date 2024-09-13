class AddLinkFiveToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :link_five, :string
  end
end
