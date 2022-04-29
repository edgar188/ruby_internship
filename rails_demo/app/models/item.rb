class Item < ApplicationRecord
  # Include modules.
  include Validations::Item
  include Modules::Item

  has_many_attached :images
    
  belongs_to :owner, polymorphic: true
  belongs_to :category, dependent: :destroy
  has_one :cart

  before_validation :set_owner, on: :create
  
  validates_presence_of :category_id, :owner, :title, :price, :countity, :state, :options
  validates_length_of :title, minimum: 2, maximum: 255
  validate :validate_price, unless: -> { self.price.nil? }
  validate :validate_countity, unless: -> { self.countity.nil? }
  validate :validate_ratting, unless: -> { self.ratting.nil? }
  validate :validate_state, unless: -> { self.ratting.nil? }
  validate :validate_options
  validate :validate_user_role
  validate :images_type

  enum state: {
    normal: 0,
    speedily: 1
  }

  def set_owner
    self.assign_attributes(owner: @@logged_in_user)
  end

end