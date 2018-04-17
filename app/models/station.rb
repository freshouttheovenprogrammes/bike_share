class Station < ApplicationRecord
  validates_presence_of :name, :latitude, :longitude, :dock_count, :city, :installation_date
end
