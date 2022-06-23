class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :conversation_user, null: false
      t.references :conversation, null: false, foreign_key: { on_delete: :cascade }
      t.text :text, null: false, default: nil
      t.json :additional_info, null: false, default: nil

      t.timestamps
    end
  end
end