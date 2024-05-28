class Venue < ApplicationRecord
  has_many :leisure_venues
  has_many :leisures, through: :leisure_venues, dependent: :destroy
  belongs_to :user
end
