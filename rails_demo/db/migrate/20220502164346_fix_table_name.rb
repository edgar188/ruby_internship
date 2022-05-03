class FixTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :rattings, :ratings
  end
end
