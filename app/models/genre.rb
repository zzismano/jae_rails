class Genre < ApplicationRecord
  has_many :leisure_genres
  has_many :leisures, through: :leisure_genres, dependent: :destroy
  belongs_to :user
end
