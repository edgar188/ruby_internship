class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # A constant that is used to set the default value of a select box.
  NO_SELECT = 'No select'
end

