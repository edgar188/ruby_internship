class AddViewsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :views, :integer, default: 0, after: :countity
  end
end
