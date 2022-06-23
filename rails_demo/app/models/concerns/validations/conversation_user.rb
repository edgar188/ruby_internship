module Validations::ConversationUser
  extend ActiveSupport::Concern

  private

  # Checking if the user is the owner of the chat room.
  def validate_room_owner
    unless room_owner?
      self.errors.add(:base, I18n.t(:wrong))
    end
  end

  # Checking if the conversation is dual and if the conversation has more than one user.
  def validate_dual_chat_members_count
    if self.conversation.dual? && self.conversation.conversation_users.count > 1
      self.errors.add(:base, I18n.t(:wrong))
    end
  end

end