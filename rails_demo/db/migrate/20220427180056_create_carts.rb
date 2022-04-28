class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :user, null: false, default: nil, foreign_key: { on_delete: :cascade }
      t.references :item, null: true, default: nil, foreign_key: { on_delete: :cascade }
      t.datetime :ordered_at, null: true, default: nil

      t.timestamps
    end
  end
end