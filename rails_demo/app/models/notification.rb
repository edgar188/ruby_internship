class Notification < ApplicationRecord
  include Modules::Notification

  belongs_to :user

end