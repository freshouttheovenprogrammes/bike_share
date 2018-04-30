class Condition < ApplicationRecord
    validates_presence_of :date, :max_temp, :mean_temp, :min_temp,
                          :mean_humidity, :mean_visibility_miles,
                          :mean_wind_speed, :precipitation_inches



end
