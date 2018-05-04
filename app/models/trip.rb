class Trip < ApplicationRecord
  validates_presence_of :start_date, :start_station_id, :end_date,
                        :duration, :bike_id, :end_station_id, :subscription, :zipcode
end
