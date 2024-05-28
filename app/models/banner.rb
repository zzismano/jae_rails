class Banner < ApplicationRecord
  has_one_attached :photo_one
  has_one_attached :photo_two
  has_one_attached :photo_three
  has_one_attached :photo_four
end
