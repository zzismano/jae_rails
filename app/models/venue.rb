class Venue < ApplicationRecord
  has_many :leisures
  belongs_to :user
end
