class Article < ActiveRecord::Base
  has_many :article_arts, dependent: :destroy
  accepts_nested_attributes_for :article_arts, allow_destroy: true
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 4 }
end



















# validates_presence_of :title, :body