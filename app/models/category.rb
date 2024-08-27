class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy
  accepts_nested_attributes_for :subcategories, allow_destroy: true
  has_many :leisures, through: :subcategories
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
