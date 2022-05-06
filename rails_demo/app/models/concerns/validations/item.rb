module Validations::Item
  extend ActiveSupport::Concern
  include Validations::Variables

  private

  # Validating the price of the item.
  def validate_price
    if self.price < 0
      self.errors.add(:price, I18n.t(:negative_value))
    end
  end

  # Validating the count of the item.
  def validate_countity
    if self.countity < 1
      self.errors.add(:count, I18n.t(:wrong_countity))
    end
  end

  # Validating the state of the item.
  def validate_state
    unless self.normal? || self.speedily?
      self.errors.add(:state, I18n.t(:not_valid))
    end
  end

  # Validating the options of the item.
  def validate_options
    if self.options.present?
      self.options.each do |option_key, option_value|
        if option_value.length < 3
          self.errors.add(:options, I18n.t(:wrong_option))
        end
      end
    end
  end

  # Checking the type of the image.
  def images_type
    self.images.each do |image|
      unless image.content_type.in?(Validations::Variables::VALID_IMAGE_TYPES)
        errors.add(:images, I18n.t(:not_valid_file))
      end
    end
  end

  # Checking the role of the user.
  def validate_user_role
    if ApplicationRecord.class_variable_get(:@@logged_in_user).role == 'buyer'
      self.errors.add(:role, I18n.t(:not_valid)) 
    end
  end

end