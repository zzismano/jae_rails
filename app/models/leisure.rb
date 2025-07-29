class Leisure < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory, optional: true
  belongs_to :user
  has_many :leisure_genres
  has_many :leisure_venues
  has_many :cards, dependent: :destroy
  has_many :genres, through: :leisure_genres, dependent: :destroy
  has_many :venues, through: :leisure_venues, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: true
  attribute :dates, :json, default: []
  validates :description, length: { minimum: 100,
    too_short: "Descrição muito curta! O mínimo é 100." }
  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  scope :published, -> {where("start_date <= ? ", Date.today) }
  scope :visible, -> {where(hidden: [false, nil] )}

  include PgSearch::Model

  pg_search_scope :global_search,
  against: [ :title, :subtitle, :director, :country, :description, :features, :min_age ],
  associated_against: {
    category: [ :name, :subcategories ],
    venues: [ :name, :address, :zone, :capacity ]
  },
  using: {
    tsearch: { prefix: true }
  }

  def dates
    read_attribute(:dates) || []
  end

  def dates=(dates_array)
    write_attribute(:dates, dates_array)
  end


end
