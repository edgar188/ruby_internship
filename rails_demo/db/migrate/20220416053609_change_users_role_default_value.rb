class ChangeUsersRoleDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role, :integer, default: 0, limit: 1
  end
end