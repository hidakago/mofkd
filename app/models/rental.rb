class Rental < ApplicationRecord
  has_many :nearest_stations, inverse_of: :rental

  accepts_nested_attributes_for :nearest_stations, allow_destroy: true
  validates :name,  presence: true
  validates :rent,  presence: true
  validates :address,  presence: true
  validates :age,  presence: true
end
