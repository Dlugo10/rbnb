class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  geocoded_by :address  
  after_validation :geocode, if: :address_changed?

  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }
end
