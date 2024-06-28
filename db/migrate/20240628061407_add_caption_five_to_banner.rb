class AddCaptionFiveToBanner < ActiveRecord::Migration[7.1]
  def change
    add_column :banners, :caption_five, :string
  end
end
