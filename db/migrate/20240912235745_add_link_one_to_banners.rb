class AddLinkOneToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :link_one, :string
  end
end
