class AddLikesToArticleArts < ActiveRecord::Migration[6.1]
  def change
    add_column :article_arts, :likes, :bigint, default: 1
  end
end
