class User < ApplicationRecord
  # has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, presence: true
         validates :email, presence: true, uniqueness: true
         validates :username, presence: true, uniqueness: true

         geocoded_by :address
         after_validation :geocode, if: :address_changed?

         def geocode_address
          if address.present? && address_changed?
            begin
              results = Geocoder.search(address)
              if results.any?
                self.latitude = results.first.latitude
                self.longitude = results.first.longitude
              else
                errors.add(:address, "could not be geocoded")
              end
            rescue => e
              errors.add(:address, "geocoding service error: #{e.message}")
            end
          end
        end
end
