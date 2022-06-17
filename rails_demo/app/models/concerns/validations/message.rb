module Validations::Message
  extend ActiveSupport::Concern

  private

  def validate_members
    unless self.user_id == self.conversation.recipient_id || self.user_id == self.conversation.sender_id
      self.errors.add(:base, I18n.t(:wrong))
    end
  end
end