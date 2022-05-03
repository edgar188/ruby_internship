module Validations::UserItem
  extend ActiveSupport::Concern

  private

  def validate_balance
    balance = ApplicationRecord.class_variable_get(:@@logged_in_user).balance

    if self.item.price >= balance
      self.errors.add(:balance, I18n.t(:negative_balance))
    end
  end

end