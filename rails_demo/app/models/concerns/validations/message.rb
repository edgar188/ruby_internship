module Validations::Message
  extend ActiveSupport::Concern

  private

  def validate_members
    unless self.user_id == self.conversation.recipient_id || self.user_id == self.conversation.sender_id
      self.errors.add(:base, I18n.t(:wrong))
    end
  end

  def attachments_type
    self.attachments.each do |attachment|
      unless attachment.content_type.in?(Validations::Variables::VALID_IMAGE_TYPES)
        errors.add(:attachments, I18n.t(:not_valid_file))
      end
    end
  end
end