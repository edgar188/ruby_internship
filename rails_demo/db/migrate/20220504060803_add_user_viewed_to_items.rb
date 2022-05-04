class AddUserViewedToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :user_viewed, :json, null: true, default: nil, after: :views
  end
end