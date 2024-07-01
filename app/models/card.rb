class Card < ApplicationRecord
  belongs_to :leisure
  has_many :section_cards
  has_many :sections, through: :section_cards
end
