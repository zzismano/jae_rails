class CreateBanners < ActiveRecord::Migration[7.1]
  def change
    create_table :banners do |t|
      t.string :caption_one
      t.string :caption_two
      t.string :caption_three
      t.string :caption_four

      t.timestamps
    end
  end
end
