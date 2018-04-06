class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  validates_numericality_of :rating, allow_nil:true, :inclusion => 1...5
end
