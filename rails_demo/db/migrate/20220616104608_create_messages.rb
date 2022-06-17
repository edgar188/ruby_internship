class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :conversation, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :read, default: false

      t.timestamps
    end
  end
end


# t.references :user, index: true, foreign_key: { on_delete: :cascade }
