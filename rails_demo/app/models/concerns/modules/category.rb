module Modules::Category
  extend ActiveSupport::Concern
  include Modules::Constants

  # Class methods will be defined here
  class_methods do
    def paginate_data(params)
      categories = self.all

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

  def show_name
    self.name
  end

  def show_parrent
    return Modules::Constants::EMPTY unless self.parrent 
    self.parrent.name if self.parrent 
  end

  def show_owner_id
    self.owner['id']
  end

  def show_owner_type
    self.owner['type']
  end

  def show_owner_full_name
    self.owner['full_name']
    
  end

  def show_options
    options = self.options['options'].to_a

    options.each do |option|
      option
    end
  end

  def level
    return 0 if self.parrent_id.nil?
    c = self
    lvl = 0

    while c.parrent_id.present?
      lvl +=1
      c = c.parrent
    end

    lvl
  end

end