class Flat < ApplicationRecord
    has_many_attached :photos
  geocoded_by :address  
  after_validation :geocode, if: :address_changed?
end
