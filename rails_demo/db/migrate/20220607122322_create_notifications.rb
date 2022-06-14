class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: { on_delete: :cascade }
      t.integer :notice_type, null: false, default: nil, limit: 1
      t.string :notice_message, null: false, default: nil

      t.timestamps
    end
  end
end