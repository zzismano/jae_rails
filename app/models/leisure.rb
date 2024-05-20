class Leisure < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  belongs_to :user
  has_many :leisure_genres
  has_many :genres, through: :leisure_genres
  has_one_attached :photo
end

