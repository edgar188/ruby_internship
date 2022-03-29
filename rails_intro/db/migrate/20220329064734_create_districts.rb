class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :name, null: true
      t.string :phone, null: true
      t.text :mailing_address, null: true
      t.text :notes, null: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end