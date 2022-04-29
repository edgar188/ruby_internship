class Category < ApplicationRecord
  # Include modules.
  include Validations::Category
  include Modules::Category
  
  belongs_to :parrent, class_name: :Category, optional: true
  has_many :childs, class_name: :Category, foreign_key: :parrent_id, dependent: :destroy
  has_many :items, dependent: :destroy
  
  before_validation :set_owner, on: :create

  validates_length_of :name, minimum: 2, maximum: 255
  validate :validate_level, unless: -> { self.level.nil? }
  validate :validate_options
  validate :validate_user_role

  def set_owner
    self.assign_attributes(
      owner: {
        id: @@logged_in_user.id, 
        type: @@logged_in_user.class.name, 
        full_name: @@logged_in_user.show_full_name 
      }
    )
  end

end