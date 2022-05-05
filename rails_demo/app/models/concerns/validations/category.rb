module Validations::Category
  extend ActiveSupport::Concern

  private

  # Validating the level of the category.
  def validate_level
    if self.level > 2 
      self.errors.add(:level, I18n.t(:wrong_level))
    end
  end

  # Validating the options of the category.
  def validate_options
    if self.options.present?
      self.options.each do |option|
        if option.length < 3
          self.errors.add(:option, I18n.t(:wrong_option))
        end
      end
    end
  end

  def validate_user_role
    if ApplicationRecord.class_variable_get(:@@logged_in_user).role == 'buyer'
      self.errors.add(:role, I18n.t(:not_valid)) 
    end
  end

end