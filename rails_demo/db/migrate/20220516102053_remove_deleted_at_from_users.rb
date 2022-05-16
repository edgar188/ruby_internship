class RemoveDeletedAtFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :deleted_at
  end
end