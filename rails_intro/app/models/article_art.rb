class ArticleArt < ActiveRecord::Base
  
  belongs_to :article, dependent: :destroy
  has_many :article_art_comments

  accepts_nested_attributes_for :article_art_comments, allow_destroy: true
  
  validates_presence_of :name
  
end