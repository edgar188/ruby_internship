module Validations::Item
  extend ActiveSupport::Concern

  private

  def validate_price
    if self.price < 0
      self.errors.add(:price, I18n.t(:negative_value))
    end
  end

  def validate_countity
    if self.countity < 1
      self.errors.add(:countity, I18n.t(:wrong_countity))
    end
  end

  def validate_ratting
    if self.ratting < 0
      self.errors.add(:ratting, I18n.t(:negative_value))
    end
  end

  def validate_state
    unless self.state.to_sym == :normal || self.state.to_sym == :speedily 
      self.errors.add(:state, I18n.t(:wrong_state))
    end
  end

end