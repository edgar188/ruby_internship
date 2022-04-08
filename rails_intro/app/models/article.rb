class Article < ActiveRecord::Base
  
  has_many :article_arts
  
  accepts_nested_attributes_for :article_arts, allow_destroy: true
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2 }
  
  after_commit :say_hello
  
  private

  def say_hello
    pp '-------------'
    pp 'HELLO'
  end

end