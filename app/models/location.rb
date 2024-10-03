class Location < ApplicationRecord
    geocoded_by :address   # Assuming you have an address field
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  
    
    reverse_geocoded_by :latitude, :longitude
end
