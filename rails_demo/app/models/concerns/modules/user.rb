module Modules::User
  extend ActiveSupport::Concern

  GENDER = {
    no_select: 'No select',
    male: 'Male',
    female: 'Female'
  }

  ROLE = {
    buyer: 'Buyer',
    seller: 'Seller'
  }

  # Class methods will be defined here
  class_methods do
    def paginate_data(params)
      users = self.all
      
      if ApplicationRecord::to_boolean(params[:gender])
        users = users.where(gender: params[:gender])
      end

      if ApplicationRecord::to_boolean(params[:balance])
        users = users.where(balance: params[:balance])
      end

      # ...
      search_query = "CONCAT(first_name, ' ', last_name) LIKE :query OR CONCAT(last_name, ' ', first_name) LIKE :query OR email LIKE :query"
      users = users.where(search_query, query: "%#{params[:query]}%") if params[:query].present?

      case params[:sort_by]
      when 'full_name'
        users = users.order("first_name #{params[:sort_type] || :DESC}, last_name #{params[:sort_type] || :ASC}")
      when 'gender'
        users = users.order(Arel.sql([1, 2, 0].map { |type| "gender=#{type} #{params[:sort_type] || :ASC}" }.join(', ')))
      when 'role'
        users = users.order(Arel.sql([0, 1].map { |type| "role=#{type} #{params[:sort_type] || :ASC}" }.join(', ')))
      else
        users = users.order("#{params[:sort_by] || :first_name} #{params[:sort_type] || :ASC}")
      end
      
      # ...
      users = users.paginate(
        page: params[:page] || ApplicationRecord::PAGE, 
        per_page: params[:per_page] || ApplicationRecord::PER_PAGE
      ) unless ApplicationRecord::to_boolean(params[:all])
      # ...
      count = users.count
      users = { result: users, count: count }
      users
    end
  end

  # A method that returns the value of the role attribute.
  def show_role
    ROLE[self.role.to_sym]
  end
  
  # A method that returns the full name of the user.
  def show_full_name
    "#{self.first_name} #{self.last_name}"
  end

  # A method that returns the value of the gender attribute.
  def show_gender
    GENDER[self.gender.to_sym]
  end

  # A method that returns the value of the birth_date attribute.
  def show_birth_date
    birth_date || ApplicationRecord::NO_SELECT
  end

  # A method that returns the value of the country attribute.
  def show_country
    country || ApplicationRecord::NO_SELECT
  end

  # A method that returns the value of the phone attribute.
  def show_phone
    phone || ApplicationRecord::NO_SELECT
  end

  # It's a method that returns the value of the created_at attribute.
  def show_create_date
    self.created_at.to_date
  end

  ## Checking

  # Checking if the user has an avatar attached to it.
  def has_avatar?
    self.avatar.attached?
  end

end
