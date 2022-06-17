module Modules::Message
  extend ActiveSupport::Concern

  # A method that returns the date in a long ordinal format.
  def show_time
    self.created_at.to_s(:long_ordinal)
  end

end