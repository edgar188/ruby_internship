class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.string :name, null: false, default: nil
      t.integer :chat_type, null: false, default: nil, limit: 1
      t.json :creator, null: false, default: nil

      t.timestamps
    end
  end
end