#some migrate...
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |item|
      ## Database authenticatable
			item.string :name
			item.string :LPN
      item.boolean :is_handicap
      item.boolean :is_parked
      item.string :email,              null: false, default: ""
      item.string :encrypted_password, null: false, default: ""

      ## Recoverable
      item.string   :reset_password_token
      item.datetime :reset_password_sent_at

      ## Rememberable
      item.datetime :remember_created_at

      ## Trackable
      item.integer  :sign_in_count, default: 0, null: false
      item.datetime :current_sign_in_at
      item.datetime :last_sign_in_at
      item.inet     :current_sign_in_ip
      item.inet     :last_sign_in_ip

      ## Confirmable
      # item.string   :confirmation_token
      # item.datetime :confirmed_at
      # item.datetime :confirmation_sent_at
      # item.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # item.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # item.string   :unlock_token # Only if unlock strategy is :email or :both
      # item.datetime :locked_at

      item.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
