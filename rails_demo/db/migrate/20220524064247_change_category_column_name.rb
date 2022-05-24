class ChangeCategoryColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :parrent_id, :parent_id
  end
end
