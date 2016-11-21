#some migrate...
class CreateParkinglots < ActiveRecord::Migration
  def change
    create_table :parkinglots do |t|
			t.string :name
			t.integer :width
      t.timestamps null: false
    end
  end
end
