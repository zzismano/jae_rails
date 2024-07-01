class Section < ApplicationRecord
  has_many :section_cards
  has_many :cards, through: :section_cards
end
