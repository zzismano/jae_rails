class SponsoredBanner < ApplicationRecord
  has_one_attached :image

  validates :sponsor_name, :link_url, presence: true
  validates :link_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "precisa começar com http:// ou https://" }
  validates :image, presence: true

  scope :current, -> {
    where(active: true)
      .where("starts_on IS NULL OR starts_on <= ?", Date.current)
      .where("ends_on IS NULL OR ends_on >= ?", Date.current)
  }
end
