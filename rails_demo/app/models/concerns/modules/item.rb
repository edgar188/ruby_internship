module Modules::Item
  extend ActiveSupport::Concern
  include Modules::Constants

  STATE = {
    normal: 'Normal',
    speedily: 'Speedily'
  }

  included do
    scope :with_query, -> (search_query, query) { where(search_query, query: "%#{query}%") }
    scope :with_category, -> (category_id) { where(category_id: category_id) }
    scope :with_price, -> (min_price, max_price) { where("price <= ? AND price >= ?", min_price, max_price)}
  end
  
  # Class methods
  class_methods do
    def paginate_data(params)
      items = Item.all

      # Get current_user items
      if Modules::Helpers::to_boolean(params[:owner])
        items = items.where(owner: ApplicationRecord.class_variable_get(:@@logged_in_user).id)
      end
      
      # Filter items by category
      if Modules::Helpers::to_boolean(params[:category_id])
        items = items.with_category(params[:category_id])
      end

      # Filter items by price
      if Modules::Helpers::to_boolean(params[:min_price] && params[:max_price])
        items = items.with_price(params[:max_price], params[:min_price])
      end

      # It's searching the items by title
      search_query = "title LIKE :query" 
      items = items.with_query(search_query, params[:query]) if params[:query].present?

      # Sort items by name 
      items = items.order("#{params[:sort_by] || :title} #{params[:sort_type] || :ASC}")
      
      # It's paginating the items list.
      items = items.paginate(
        page: params[:page] || Modules::Constants::PAGE, 
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Helpers::to_boolean(params[:all])

      # Get items and items count
      items = { result: items, count: count }
      items
    end
  end

  # It's showing the title of the item.
  def show_title
    self.title
  end

  # It's showing the category of the item.
  def show_category
    Category.find_by_id(self.category_id).name
  end

  # It's showing the full name of the owner of the item.
  def show_owner_full_name
    self.owner.show_full_name
  end

  # It's showing the state of the item.
  def show_state
    STATE[self.state.to_sym]
  end

  # It's showing the date of the last modification of the item.
  def show_modified_date
    self.updated_at.to_date
  end

end