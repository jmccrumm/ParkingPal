class CreateParkingspots < ActiveRecord::Migration
  def change
    create_table :parkingspots do |t|

      t.timestamps null: false
    end
  end
end
