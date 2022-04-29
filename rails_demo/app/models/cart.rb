class Cart < ApplicationRecord

  # belongs_to :user, dependent: :destroy
  # has_many :items, dependent: :destroy
  
  belongs_to :user
  belongs_to :product

end
