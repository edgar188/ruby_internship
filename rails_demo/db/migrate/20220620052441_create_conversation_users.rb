class CreateConversationUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_users do |t|
      t.references :conversation, null: false, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end