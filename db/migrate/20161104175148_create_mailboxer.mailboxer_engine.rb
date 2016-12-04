# This migration comes from mailboxer_engine (originally 20110511145103)
# :reek:DuplicateMethodCall { max_calls: 5 }
class CreateMailboxer < ActiveRecord::Migration
  def self.up
  #Tables
    #Conversations
    create_table :mailboxer_conversations do |item|
      item.column :subject, :string, :default => ""
      item.column :created_at, :datetime, :null => false
      item.column :updated_at, :datetime, :null => false
    end
    #Receipts
    create_table :mailboxer_receipts do |item|
      item.references :receiver, :polymorphic => true
      item.column :notification_id, :integer, :null => false
      item.column :is_read, :boolean, :default => false
      item.column :trashed, :boolean, :default => false
      item.column :deleted, :boolean, :default => false
      item.column :mailbox_type, :string, :limit => 25
      item.column :created_at, :datetime, :null => false
      item.column :updated_at, :datetime, :null => false
    end
    #Notifications and Messages
    create_table :mailboxer_notifications do |item|
      item.column :type, :string
      item.column :body, :text
      item.column :subject, :string, :default => ""
      item.references :sender, :polymorphic => true
      item.column :conversation_id, :integer
      item.column :draft, :boolean, :default => false
      item.string :notification_code, :default => nil
      item.references :notified_object, :polymorphic => true
      item.column :attachment, :string
      item.column :updated_at, :datetime, :null => false
      item.column :created_at, :datetime, :null => false
      item.boolean :global, default: false
      item.datetime :expires
    end

  #Indexes
    #Conversations
    #Receipts
    add_index "mailboxer_receipts","notification_id"

    #Messages
    add_index "mailboxer_notifications","conversation_id"

  #Foreign keys
    #Conversations
    #Receipts
    add_foreign_key "mailboxer_receipts", "mailboxer_notifications", :name => "receipts_on_notification_id", :column => "notification_id"
    #Messages
    add_foreign_key "mailboxer_notifications", "mailboxer_conversations", :name => "notifications_on_conversation_id", :column => "conversation_id"
  end

  def self.down
  #Tables
    remove_foreign_key "mailboxer_receipts", :name => "receipts_on_notification_id"
    remove_foreign_key "mailboxer_notifications", :name => "notifications_on_conversation_id"

  #Indexes
    drop_table :mailboxer_receipts
    drop_table :mailboxer_conversations
    drop_table :mailboxer_notifications
  end
end
