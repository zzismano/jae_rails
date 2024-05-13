class Leisure < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  has_many :genres
end
