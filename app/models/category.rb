class Category < ApplicationRecord
  has_many :leisures
  belongs_to :user
end
