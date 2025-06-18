class AddMultipleAltTextsToBanners < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :alt_text_one, :string
    add_column :banners, :alt_text_two, :string
    add_column :banners, :alt_text_three, :string
    add_column :banners, :alt_text_four, :string
    add_column :banners, :alt_text_five, :string
  end
end
