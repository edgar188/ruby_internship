class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: { on_delete: :cascade }
      t.string :notice_type, null: false, default: nil
      t.string :notice_message, null: false, default: nil

      t.timestamps
    end
  end
end