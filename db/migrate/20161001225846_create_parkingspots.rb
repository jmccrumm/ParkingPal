#some migrate...
class CreateParkingspots < ActiveRecord::Migration
  def change
    create_table :parkingspots do |item|
    	item.integer :parkinglot_id
		item.string :spot_type #handicap, normal
		item.string :status #open, reserved, taken
		item.integer :occupying #id of user who is currently holding the spot or reserving it (null if open)
      	item.timestamps null: false
    end
  end
end
