class Banner < ApplicationRecord
  has_one_attached :photo_one
  has_one_attached :photo_two
  has_one_attached :photo_three
  has_one_attached :photo_four
  has_one_attached :photo_five

  validates :caption_one, :caption_two, :photo_one, :photo_two, presence: true
end
