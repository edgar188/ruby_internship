module Validations::Friendship
  extend ActiveSupport::Concern

  private

  @@logged_in_user = ApplicationRecord.class_variable_get(:@@logged_in_user)

  def validate_self_request
    if @@logged_in_user.id == self.sent_to_id
      self.errors.add(:base, I18n.t(:self_request))
    end
  end

  def validate_already_sent_request
    if friend_request_received?(User.find(self.sent_to.id)) || friend_request_sent?(User.find(self.sent_to.id))
      self.errors.add(:base, I18n.t(:already_sent_request))
    end
  end

  def validate_already_friends
    if self.check_friends
      self.errors.add(:base, I18n.t(:already_friends))
    end
  end

end