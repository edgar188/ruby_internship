class ArticleArtComment < ActiveRecord::Base
  belongs_to :article_art, dependent: :destroy
end
