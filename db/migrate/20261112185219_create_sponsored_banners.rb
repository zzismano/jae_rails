class CreateSponsoredBanners < ActiveRecord::Migration[7.1]
  def change
    create_table :sponsored_banners do |t|
      t.string :sponsor_name
      t.string :link_url
      t.boolean :active, default: false, null: false
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
