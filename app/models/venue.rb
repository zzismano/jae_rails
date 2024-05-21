class Venue < ApplicationRecord
  has_many :leisures, through: :leisure_venues
  belongs_to :user
end
