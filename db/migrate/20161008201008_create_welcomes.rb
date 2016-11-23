#some migrate...
class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |item|

      item.timestamps null: false
    end
  end
end
