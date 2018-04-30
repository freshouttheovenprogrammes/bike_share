class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.datetime :start_date
      t.bigint :start_station_id
      t.datetime :end_date
      t.bigint :end_station_id
      t.integer :bike_id
      t.string :subscription
      t.bigint :zipcode
    end
  end
end
