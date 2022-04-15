class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # A constant that is used to set the default value of a select box.
  NO_SELECT = 'No select'
  PAGE = 1
  PER_PAGE = 10
  
  def self.to_boolean(value)
    ActiveModel::Type::Boolean.new.cast(value).present?
  end
end

