module Modules::Constants
  extend ActiveSupport::Concern
  
  # A constant that is used to set the default value of a select box.
  NO_SELECT = 'No select'
  # A constant that is used to set the count of pages.
  PAGE = 1
  # A constant that is used to set the count of items in per page.
  PER_PAGE = 10
  
  # A method that is used to convert a value to boolean.
  def self.to_boolean(value)
    ActiveModel::Type::Boolean.new.cast(value).present?
  end

end