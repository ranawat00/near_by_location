class Appointment < ApplicationRecord
  belongs_to :user
  validates :salon_name, :appointment_date, :service, presence: true
end
