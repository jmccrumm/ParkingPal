#some migrate...
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |item|

      item.timestamps null: false
    end
  end
end
