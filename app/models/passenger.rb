class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :phone_num, presence: true

  def total_cost
    total = trips.inject(0) { |sum, trip| sum + trip.cost }
    return total/100
  end
end
