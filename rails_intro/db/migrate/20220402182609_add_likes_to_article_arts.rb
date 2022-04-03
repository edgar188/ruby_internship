class AddLikesToArticleArts < ActiveRecord::Migration[6.1]
  def change
    add_column :article_arts, :likes, :bigint
  end
end
