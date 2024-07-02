class Section < ApplicationRecord
  has_many :section_cards, dependent: :destroy
  has_many :cards, through: :section_cards
end
