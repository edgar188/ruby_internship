class RemoveRattingFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :ratting
  end
end
