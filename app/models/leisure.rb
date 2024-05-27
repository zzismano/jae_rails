class Leisure < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :leisure_genres
  has_many :leisure_venues
  has_many :genres, through: :leisure_genres, dependent: :destroy
  has_many :venues, through: :leisure_venues, dependent: :destroy
  has_one_attached :photo
end
