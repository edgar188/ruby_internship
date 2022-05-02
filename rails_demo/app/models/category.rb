class Category < ApplicationRecord
  # Include modules.
  include Validations::Category
  include Modules::Category
  
  belongs_to :parrent, class_name: :Category, optional: true
  has_many :childs, class_name: :Category, foreign_key: :parrent_id, dependent: :destroy
  has_many :items, dependent: :destroy
  
  before_validation :set_owner, on: :create

  validates_length_of :name, minimum: 2, maximum: 255
  validates_uniqueness_of :name
  validate :validate_level, unless: -> { self.level.nil? }
  validate :validate_options
  validate :validate_user_role

end