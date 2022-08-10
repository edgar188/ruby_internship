module Modules::Item
  extend ActiveSupport::Concern
  include Modules::Constants

  STATE = {
    normal: 'Normal',
    speedily: 'Speedily'
  }.freeze

  included do
    scope :with_query, -> (search_query, query) { where(search_query, query: "%#{query}%") }
    scope :with_current, -> { where(owner: ApplicationRecord.class_variable_get(:@@logged_in_user).id) }
    scope :with_not_current, -> { where.not(owner: ApplicationRecord.class_variable_get(:@@logged_in_user).id) }
    scope :with_category, -> (id) { where(category_id: id) }
    scope :with_category_name, -> (name) { joins(:category).where(category: { name: name }) }
    scope :with_price, -> (min_price, max_price) { where('price <= ? AND price >= ?', min_price, max_price) }
    scope :with_previous_day, -> { where('items.created_at > ? AND items.created_at < ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day) }
  end

  # Class methods
  class_methods do
    def paginate_data(params)
      items = self.joins(:category)

      # Get current_user items
      if Modules::Helpers.to_boolean(params[:owner])
        items = items.with_current
      end

      # Get not current_user items
      if Modules::Helpers.to_boolean(params[:not_owner])
        items = items.with_not_current
      end

      # Filter items by category
      if Modules::Helpers.to_boolean(params[:category_id])
        items = items.with_category(params[:category_id])
      end

      # Filter items by price
      if Modules::Helpers.to_boolean(params[:min_price] && params[:max_price])
        items = items.with_price(params[:max_price], params[:min_price])
      end

      # Filter items by category_name
      if Modules::Helpers.to_boolean(params[:category_name]) && params[:category_name][0] != ''
        items = items.with_category_name(params[:category_name][0])
      end

      # It's searching the items by title
      search_query = 'title LIKE :query'
      items = items.with_query(search_query, params[:query]) if params[:query].present?

      # Sort items by name
      items = items.order("#{params[:sort_by] || :title} #{params[:sort_type] || :ASC}")

      # It's paginating the items list.
      unless Modules::Helpers.to_boolean(params[:all])
        items = items.paginate(
          page: params[:page] || Modules::Constants::PAGE,
          per_page: params[:per_page] || Modules::Constants::PER_PAGE
        )
      end

      # Get items and items count
      items = { result: items, count: count }
      items
    end

    # It's a method that creates a folder for the items pdf's.
    def create_folder
      dirname = File.dirname("#{Rails.root}/storage/system/pdf/ ")
      FileUtils.mkdir_p(dirname) unless Dir.exist?(dirname)
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

  # It's showing the description of the item.
  def show_description
    self.description || Modules::Constants::NO_SELECT
  end

  # It's showing the count of the views of the item.
  def show_views_count
    self.views['count']
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
    self.ratings.present? ? self.ratings.average(:value).round(2) : 0
  end

  # It's getting the user that rated the item.
  def get_rated_user
    self.ratings.find_by_user_id(ApplicationRecord.class_variable_get(:@@logged_in_user).id)
  end

  # It's incrementing the count of the views of the item.
  def view_increment
    current_user_id = ApplicationRecord.class_variable_get(:@@logged_in_user).id.to_s
    count = self.views['count'].to_i
    user_viewed = self.views['user_viewed']

    if current_user_id.present? && !self.views['user_viewed'].include?(current_user_id)
      count += 1
      user_viewed[current_user_id] = DateTime.current
    end

    self.update_column(:views, { count: count, user_viewed: user_viewed })
  end

  # It's setting the default value of the views.
  def set_default_view
    self.assign_attributes(
      views: {
        count: 1,
        user_viewed: { "#{ApplicationRecord.class_variable_get(:@@logged_in_user).id}": Date.current }
      }
    )
  end

  # It's sending an email when created the item.
  def send_mail
    ItemMailer.with(
      user: ApplicationRecord.class_variable_get(:@@logged_in_user),
      item: self
    ).item_created.deliver_later
  end

end