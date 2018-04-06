class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true


  def total_earnings
    subtotal = trips.inject(0) {| sum , trip| sum + trip.cost - 1.65} * 0.8
    total = subtotal / 100
    return sprintf('%.02f', total)
  end

  def average_rating
    return if trips.empty?
    total_ratings = 0
    trips.each do |t|
      total_ratings += t.rating
    end
    return sprintf('%.01f', total_ratings/trips.length)
  end

  # def select_driver
  #   drivers = Driver.all
  #   drivers_available = drivers.reject { |driver| driver.available == false }
  #   return drivers_available.first
  # end

end
