#some migrate...
class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |item|

      item.timestamps null: false
    end
  end
end
