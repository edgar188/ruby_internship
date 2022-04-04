class ArticleArt < ActiveRecord::Base
  has_many :article_art_comments
  accepts_nested_attributes_for :article_art_comments, allow_destroy: true
  belongs_to :article, dependent: :destroy
  validates_presence_of :name
end