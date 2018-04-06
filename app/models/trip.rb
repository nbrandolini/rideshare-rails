class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  validates :rating, numericality: { only_float: true, allow_nil: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :passenger_id, presence: true, numericality: { only_integer: true }
  validates :driver_id, presence: true, numericality: { only_integer: true }


end
