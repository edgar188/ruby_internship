module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = User.find_by(id: ApplicationRecord.class_variable_get(:@@logged_in_user).id)
        return verified_user
      end

      reject_unauthorized_connection
    end
  end
end