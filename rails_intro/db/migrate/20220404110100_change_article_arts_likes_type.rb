class ChangeArticleArtsLikesType < ActiveRecord::Migration[6.1]
  def change
    change_column :article_arts, :likes, :integer, default: 0, after: :name
  end
end
