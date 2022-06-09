module Modules::Friendship
  extend ActiveSupport::Concern

  @@logged_in_user = ApplicationRecord.class_variable_get(:@@logged_in_user)

  included do
    scope :friends, -> { where(status: true) }
    scope :not_friends, -> { where(status: false) }
  end

  def friend_request_sent?(user, status = false)
    @@logged_in_user.friend_sent.exists?(sent_to_id: user.id, status: status)
  end

  def friend_request_received?(user, status = false)
    @@logged_in_user.friend_request.exists?(sent_by_id: user.id, status: status)
  end

  def sent_friend_request_notice
    Notification.create(user_id: sent_to.id, notice_type: 'friend_request', notice_message: "#{@@logged_in_user.show_full_name} sent you friend request" )
    Notification.create(user_id: @@logged_in_user.id, notice_type: 'friend_request', notice_message: "You sent friend request to #{User.find(sent_to.id).show_full_name}" )
  end

  def sent_friend_accept_notice
    if self.status_changed?
      Notification.create(user_id: sent_by.id, notice_type: 'accept_friend_request', notice_message: "#{@@logged_in_user.show_full_name} accepted your friend request")
    end
  end

  def sent_friend_decline_notice
    Notification.create(user_id: sent_by.id, notice_type: 'decline_friend_request', notice_message: "#{@@logged_in_user.show_full_name} declined your friend request")
  end

end