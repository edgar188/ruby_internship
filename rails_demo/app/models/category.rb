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

  def set_owner
    self.errors.add(:role, I18n.t(:wrong_role)) if @@logged_in_user.role == 'buyer'
    user = @@logged_in_user

    self.assign_attributes(
      owner: {
        id: user.id, 
        type: user.class.name, 
        full_name: user.show_full_name 
      }
    )
  end

end