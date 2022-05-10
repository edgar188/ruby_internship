module Validations::UserItem
  extend ActiveSupport::Concern

  private

  def validate_balance
    balance = ApplicationRecord.class_variable_get(:@@logged_in_user).balance

    if self.item.price > balance
      self.errors.add(:balance, I18n.t(:negative_balance))
    end
  end

  def validate_item_countity
    if self.item.countity <= 0 
      self.errors.add(:count, I18n.t(:negative_value))
    end
  end

  def validate_ordered_at
    unless self.ordered_at_changed?
      self.errors.add(:ordered_at, I18n.t(:wrong))    
    end
  end
  
end