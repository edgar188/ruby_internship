class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :sent_by, null: false, default: nil, foreign_key: { to_table: :users, on_delete: :cascade }
      t.references :sent_to, null: false, default: nil, foreign_key: { to_table: :users, on_delete: :cascade }
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end