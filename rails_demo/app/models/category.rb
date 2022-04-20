class Category < ApplicationRecord
    belongs_to :parent, class_name: :Category, optional: true
    has_many :childs, class_name: :Category, foreign_key: :parent_id, dependent: :destroy
    has_many :items, dependent: :destroy
end