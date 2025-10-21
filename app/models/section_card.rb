class SectionCard < ApplicationRecord
  belongs_to :card
  belongs_to :section

  default_scope { order(created_at: :desc) }
end
