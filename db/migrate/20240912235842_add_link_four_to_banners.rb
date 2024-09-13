class AddLinkFourToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :link_four, :string
  end
end
