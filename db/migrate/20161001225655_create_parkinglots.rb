#some migrate...
class CreateParkinglots < ActiveRecord::Migration
  def change
    create_table :parkinglots do |item|
			item.string :name
			item.integer :width
      item.timestamps null: false
    end
  end
end
