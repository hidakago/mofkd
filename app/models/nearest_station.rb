class NearestStation < ApplicationRecord
  belongs_to :rental, inverse_of: :nearest_stations
end
