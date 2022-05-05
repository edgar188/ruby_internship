module Modules::AdminUser
  extend ActiveSupport::Concern

  # A method that returns the full name of the admin user.
  def show_full_name
    "#{self.first_name} #{self.last_name}"
  end

end
