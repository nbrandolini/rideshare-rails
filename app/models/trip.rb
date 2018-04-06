class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  # validates :rating, numericality: { only_float: true }

end
