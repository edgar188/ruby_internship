class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.integer :recipient_id, index: true
      t.integer :sender_id, index: true

      t.timestamps
    end

    add_index :conversations, [:recipient_id, :sender_id], unique: true
  end
end


# class CreateCarts < ActiveRecord::Migration[6.1]
#   def change
#     create_table :user_items do |t|
#       t.references :user, index: true, foreign_key: { on_delete: :cascade }
#       t.references :item, index: true, foreign_key: { on_delete: :cascade }
#       t.datetime :ordered_at, null: true, default: nil

#       t.timestamps
#     end
#   end
# end