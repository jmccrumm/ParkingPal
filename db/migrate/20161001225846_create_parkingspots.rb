class CreateParkingspots < ActiveRecord::Migration
  def change
    create_table :parkingspots do |t|
			t.string :type;
			t.string :status;

      t.timestamps null: false
    end
  end
end
