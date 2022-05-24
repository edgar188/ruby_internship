class ChangeUrlOnItemResources < ActiveRecord::Migration[6.1]
  def change
    change_column :item_resources, :url, :text, null: true, default: nil
  end
end
