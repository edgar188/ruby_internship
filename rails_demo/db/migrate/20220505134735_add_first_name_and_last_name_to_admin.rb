class AddFirstNameAndLastNameToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :last_name, :string, null: true, default: nil, after: :email
    add_column :admin_users, :first_name, :string, null: true, default: nil, after: :email
  end
end