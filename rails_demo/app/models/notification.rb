class Notification < ApplicationRecord
  include Modules::Notification

  belongs_to :user

  enum notice_type: {
    friend_request: 0,
    accept_friend_request: 1,
    decline_friend_request: 2
  }

end