class Article < ActiveRecord::Base

  has_many :article_arts, dependent: :destroy
  
  accepts_nested_attributes_for :article_arts, allow_destroy: true

  validates_presence_of :title, :body

end
