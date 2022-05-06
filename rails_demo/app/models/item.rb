class Item < ApplicationRecord
  include Validations::Item
  include Modules::Item

  belongs_to :owner, polymorphic: true
  belongs_to :category
  has_many :user_items
  has_many :ratings
  has_many_attached :images

  acts_as_paranoid

  auto_strip_attributes :title, squish: true

  before_validation :set_owner, on: :create
  before_validation :set_default_view, on: :create
  
  validates_presence_of :category_id, :owner, :title, :price, :countity, :state, :options
  validates_length_of :title, minimum: 2, maximum: 255
  validate :validate_price, unless: -> { self.price.nil? }
  validate :validate_countity, unless: -> { self.countity.nil? }
  validate :validate_state, unless: -> { self.state.nil? }
  validate :validate_options
  validate :validate_user_role
  validate :images_type

  after_create :send_mail

  enum state: {
    normal: 0,
    speedily: 1
  }
    
end