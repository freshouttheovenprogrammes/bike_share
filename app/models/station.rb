class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:finders]
  validates_presence_of :name, :latitude, :longitude, :dock_count, :city, :installation_date
end
