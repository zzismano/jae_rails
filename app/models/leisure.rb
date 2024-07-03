class Leisure < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :leisure_genres
  has_many :leisure_venues
  has_many :cards, dependent: :destroy
  has_many :genres, through: :leisure_genres, dependent: :destroy
  has_many :venues, through: :leisure_venues, dependent: :destroy
  has_one_attached :photo
  validates :description, length: { minimum: 100,
    too_short: "Descrição muito curta! O mínimo é 100." }
  scope :published, -> {where("publish_date <= ? ", Date.today) }
  scope :visible, -> {where(hidden: [false, nil] )}
end
