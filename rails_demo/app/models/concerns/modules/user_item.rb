module Modules::UserItem
  extend ActiveSupport::Concern
  include Modules::Constants

  class_methods do
    def paginate_data_not_ordered(params)
      user_items = self

      # It's paginating the user_items list.
      user_items = user_items.paginate(
        page: params[:page] || Modules::Constants::PAGE, 
        per_page: params[:per_page] || 12
      ) unless Modules::Helpers::to_boolean(params[:all])

      # Get user_items and user_items count
      user_items = self.select { |u_i| u_i.ordered_at.nil? }
      user_items
    end

    def paginate_data_ordered(params)
      user_items = self
      
      user_items = user_items.paginate(
        page: params[:page] || Modules::Constants::PAGE, 
        per_page: params[:per_page] || 12
      ) unless Modules::Helpers::to_boolean(params[:all])

      user_items = self.select { |u_i| u_i.ordered_at.present? }
      user_items

    end
  end

  def show_date
    self.ordered_at.to_s(:long_ordinal)
  end

end