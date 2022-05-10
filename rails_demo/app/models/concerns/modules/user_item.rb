module Modules::UserItem
  extend ActiveSupport::Concern
  include Modules::Constants

  class_methods do
    def paginate_data(params)
      user_items = self.all

      user_items = user_items.where(ordered_at: nil) if Modules::Helpers::to_boolean(params[:not_ordered]) 
      user_items = user_items.where.not(ordered_at: nil) if Modules::Helpers::to_boolean(params[:ordered]) 
      
      unless Modules::Helpers::to_boolean(params[:all])
        user_items = user_items.paginate(
          page: params[:page] || Modules::Constants::PAGE,
          per_page: params[:per_page] || Modules::Constants::PER_PAGE
        )
      end

      # Get items and items count
      user_items = { result: user_items, count: count }
      user_items
    end
  end

  # A method that returns the date in a long ordinal format.
  def show_date
    self.ordered_at.to_s(:long_ordinal)
  end

  # Subtracting the price of the item from the user's balance and count of items.
  def pay
    current = ApplicationRecord.class_variable_get(:@@logged_in_user)
    balance = current.balance 
    balance -= self.item.price
    current.update_columns(balance: balance) 
    item = self.item
    countity = item.countity
    countity -= 1
    item.update_columns(countity: countity)
  end

end