module Modules::User
  extend ActiveSupport::Concern
  include Modules::Constants

  GENDER = {
    no_select: 'No select',
    male: 'Male',
    female: 'Female'
  }

  ROLE = {
    buyer: 'Buyer',
    seller: 'Seller'
  }

  included do
    scope :with_role, -> (role) { where(role: role) }
    scope :with_gender, -> (gender) { where(gender: gender) }
    scope :with_query, -> (search_query, query) { where(search_query, query: "%#{query}%") }
  end
  
  # Class methods will be defined here
  class_methods do
    def paginate_data(params)
      users = self.all

      # # A method that is used to convert a value to boolean.
      # def to_boolean(value)
      #   ActiveModel::Type::Boolean.new.cast(value).present?
      # end

      # Filter users by role and gender
      if Modules::Constants::to_boolean(params[:role])
        users = users.with_role(params[:role])
      end

      
      users = users.male

      if Modules::Constants::to_boolean(params[:gender])
        users = users.with_gender(params[:gender])
      end

      # Search users by first_name, last_name and email
      search_query = "CONCAT(first_name, ' ', last_name) LIKE :query OR CONCAT(last_name, ' ', first_name) LIKE :query OR email LIKE :query"
      users = users.with_query(search_query, params[:query]) if params[:query].present?

      # Sort users by full_name, gender, role
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
      
      # It's paginating the users list.
      users = users.paginate(
        page: params[:page] || Modules::Constants::PAGE, 
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Constants::to_boolean(params[:all])

      # Get users and users count
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
    birth_date || Modules::Constants::NO_SELECT
  end

  # A method that returns the value of the country attribute.
  def show_country
    country || Modules::Constants::NO_SELECT
  end

  # A method that returns the value of the phone attribute.
  def show_phone
    phone || Modules::Constants::NO_SELECT
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