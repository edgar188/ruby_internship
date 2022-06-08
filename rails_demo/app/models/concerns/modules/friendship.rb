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

  def sent_friend_request_notice
    Notification.create(user_id: sent_to.id, notice_type: 'friend_request', notice_message: "#{ApplicationRecord.class_variable_get(:@@logged_in_user).show_full_name} sent you friend request" )
    Notification.create(user_id: ApplicationRecord.class_variable_get(:@@logged_in_user).id, notice_type: 'friend_request', notice_message: "You sent friend request to #{User.find(sent_to.id).show_full_name}" )
  end

end