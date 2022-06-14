module Modules::Notification
  extend ActiveSupport::Concern

  @@logged_in_user = ApplicationRecord.class_variable_get(:@@logged_in_user)

  class_methods do
    def paginate_data(params)
      notifications = @@logged_in_user.notifications

      # It's paginating the notifications list.
      notifications = notifications.paginate(
        page: params[:page] || Modules::Constants::PAGE,
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Helpers::to_boolean(params[:all])

      # Get logged_in_user notifications and notifications count
      notifications = { result: notifications, count: count }
      notifications
    end
  end
end