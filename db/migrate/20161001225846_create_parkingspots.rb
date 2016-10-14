class CreateParkingspots < ActiveRecord::Migration
  def change
    create_table :parkingspots do |t|
    		t.integer :location #used to mark location in lot
			t.string :type #handicap, normal, security
			t.string :status #open, reserved, taken
			t.text :occupying #name of user who is currently holding the spot or reserving it (null if open)
      t.timestamps null: false
    end
  end
end
