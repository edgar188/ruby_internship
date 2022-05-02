module Modules::Item
  extend ActiveSupport::Concern
  include Modules::Constants

  STATE = {
    normal: 'Normal',
    speedily: 'Speedily'
  }

  included do
    scope :with_query, -> (search_query, query) { where(search_query, query: "%#{query}%") }
    scope :with_current, -> { where(owner: ApplicationRecord.class_variable_get(:@@logged_in_user).id) }
    scope :with_not_current, -> { where.not(owner: ApplicationRecord.class_variable_get(:@@logged_in_user).id) }
    scope :with_category, -> (id) { where(category_id: id) }
    scope :with_category_name, -> (name) { joins(:category).where(category: { name: name }) }
    scope :with_price, -> (min_price, max_price) { where("price <= ? AND price >= ?", min_price, max_price)}
  end
  
  # Class methods
  class_methods do
    def paginate_data(params)
      items = self.joins(:category)

      # Get current_user items
      if Modules::Helpers::to_boolean(params[:owner])
        items = items.with_current
      end

      # Get not current_user items
      if Modules::Helpers::to_boolean(params[:not_owner])
        items = items.with_not_current
      end
      
      # Filter items by category
      if Modules::Helpers::to_boolean(params[:category_id])
        items = items.with_category(params[:category_id])
      end

      # Filter items by price
      if Modules::Helpers::to_boolean(params[:min_price] && params[:max_price])
        items = items.with_price(params[:max_price], params[:min_price])
      end
      
      # Filter items by category_name
      if Modules::Helpers::to_boolean(params[:category_name]) && params[:category_name][0] != ''
        items = items.with_category_name(params[:category_name][0])
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

  # It's showing the category of the item.
  def show_category
    self.category.name
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

  # It's checking if the current user is the owner of the item.
  def correct_user?
    ApplicationRecord.class_variable_get(:@@logged_in_user) == self.owner
  end

  # It's setting the owner of the item.
  def set_owner
    self.assign_attributes(owner: ApplicationRecord.class_variable_get(:@@logged_in_user))
  end

  # Calculating the average of the ratings of the item.
  def rating
    if self.ratings.blank?
      @average_rating = 0
    else
      @average_rating = self.ratings.average(:value).round(2)
    end
  end

end