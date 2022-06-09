module Modules::Notification
  extend ActiveSupport::Concern

  @@logged_in_user = ApplicationRecord.class_variable_get(:@@logged_in_user)

  class_methods do
    def paginate_data(params)
      notifications = @@logged_in_user.notifications

      # Get logged_in_user notifications and notifications count
      notifications = { result: notifications, count: count }
      notifications
    end
  end
end