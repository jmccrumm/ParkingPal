class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #t.integer :user_id
      t.string :name
      t.string :LPN
      t.timestamps null: false
    end
  end
end
