module Modules::Category
  extend ActiveSupport::Concern
  include Modules::Constants

  included do
    scope :with_query, -> (search_query, query) { where(search_query, query: "%#{query}%") }
  end

  # Class methods
  class_methods do
    def paginate_data(params)
      categories = Category.all

      # It's searching the categories list by name or owner full_name.
      search_query = "name LIKE :query OR LOWER(JSON_EXTRACT(owner, '$.full_name')) LIKE :query" 
      categories = categories.with_query(search_query, params[:query]) if params[:query].present?
      
      # It's sorting the categories list by name or by owner full_name.
      categories = categories.order("#{params[:sort_by] || :name} #{params[:sort_type] || :ASC}")

      # It's paginating the categories list.
      categories = categories.paginate(
        page: params[:page] || Modules::Constants::PAGE, 
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Helpers::to_boolean(params[:all])

      # Get categories and categories count
      categories = { result: categories, count: count }
      categories
    end
  end

  # It's showing the name of the category.
  def show_name
    self.name
  end

  # It's showing the name of the parrent category.
  def show_parrent
    return Modules::Constants::EMPTY unless self.parrent 
    self.parrent.name if self.parrent 
  end

  # It's showing the full name of the owner of the category.
  def show_owner_full_name
    self.owner['full_name']
  end

  # It's showing the options of the category.
  def show_options
    options = self.options.to_a

    options.each do |option|
      option
    end
  end

  # It's getting the level of the category.
  def level
    return 0 if self.parrent_id.nil?
    ctg = self
    lvl = 0

    while ctg.parrent_id.present?
      lvl +=1
      ctg = ctg.parrent
    end

    lvl
  end

end