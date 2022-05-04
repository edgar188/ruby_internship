class ChangeUserViewedToViews < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :user_viewed, :views
  end
end