module Modules::Friendship
  extend ActiveSupport::Concern

  included do
    scope :friends, -> { where('status =?', true) }
    scope :not_friends, -> { where('status =?', false) }
  end

  def friend_request_sent?(user)
    ApplicationRecord.class_variable_get(:@@logged_in_user).friend_sent.exists?(sent_to_id: user.id, status: false)
  end

  def friend_request_received?(user)
    ApplicationRecord.class_variable_get(:@@logged_in_user).friend_request.exists?(sent_by_id: user.id, status: false)
  end

end