class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true


  def total_earnings
    trips.inject(0) {| sum , trip| sum + trip.cost - 1.65} * 0.8
  end

  def average_rating
    return if trips.empty?
    total_ratings = 0
    trips.each do |t|
      total_ratings += t.rating
    end
    return total_ratings.to_f/trips.length.round(1)
  end

end
