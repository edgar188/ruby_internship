module Modules::User
  extend ActiveSupport::Concern
  include Modules::Constants
  include Modules::Helpers

  GENDER = {
    no_select: 'No select',
    male: 'Male',
    female: 'Female'
  }.freeze

  ROLE = {
    buyer: 'Buyer',
    seller: 'Seller'
  }.freeze

  included do
    scope :with_role, -> (role) { where(role: role) }
    scope :with_gender, -> (gender) { where(gender: gender) }
    scope :with_birth_date, -> (min_age, max_age) { where('YEAR(birth_date) BETWEEN ? AND ?', min_age, max_age) }
    scope :with_query, -> (search_query, query) { where(search_query, query: "%#{query}%") }
    scope :except_current_user, -> (id) { where.not(id: id) }
    scope :with_previous_day, -> { where('users.created_at > ? AND users.created_at < ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day) }
  end

  # Class methods
  class_methods do
    def paginate_data(params)
      users = self.all

      # Filter out current user
      users = users.except_current_user(ApplicationRecord.class_variable_get(:@@logged_in_user).id)

      # Filter users by role
      if Modules::Helpers.to_boolean(params[:role])
        users = users.with_role(params[:role])
      end

      # Filter users by gender
      if Modules::Helpers.to_boolean(params[:gender])
        users = users.with_gender(params[:gender])
      end

      # Filter users by age
      if Modules::Helpers.to_boolean(params[:min_age] && params[:max_age])
        min_age = get_age(params[:min_age])
        max_age = get_age(params[:max_age])
        users = users.with_birth_date(max_age, min_age)
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
      unless Modules::Helpers.to_boolean(params[:all])
        users = users.paginate(
          page: params[:page] || Modules::Constants::PAGE,
          per_page: params[:per_page] || Modules::Constants::PER_PAGE
        )
      end

      # Get users and users count
      users = { result: users, count: count }
      users
    end

    # It's a method that returns the age of the user.
    def get_age(age)
      DateTime.current.to_date.year - age.to_i
    end

    # It's a method that creates a folder for the users csv's.
    def create_folder(user_id)
      dirname = File.dirname("#{Rails.root}/storage/system/csv/ ")
      FileUtils.mkdir_p(dirname) unless Dir.exist?(dirname)
      filename = "#{dirname}/users_#{user_id}.csv"
    end

    # It's a method that returns the list of users in CSV format.
    def export_csv
      users = self.paginate_data(all: true)[:result]
      headers = ['First name', 'Last name', 'Email', 'Role', 'Gender', 'Phone']
      columns = ['first_name', 'last_name', 'email', 'role', 'gender', 'phone']
      filename = create_folder(ApplicationRecord.class_variable_get(:@@logged_in_user).id)

      CSV.open(filename, 'wb', write_headers: true, headers: headers) do |csv|
        users.each do |user|
          csv << user.attributes.values_at(*columns)
        end
      end
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

  # Calculating the balance after buying all the items in the user's cart.
  def balance_after_buy_all
    self.balance - self.user_items.total_price
  end

  def ordered_items
    self.user_items.with_ordered
  end

  def not_ordered_items
    self.user_items.with_not_ordered
  end

  # It's a method that returns the list of friends of the user.
  def friends
    friendships = User.except_current_user(self.id).left_outer_joins(:friend_request, :friend_sent)
    friendships.where(friend_request: { sent_to_id: self.id, status: true })
      .or(friendships.where(friend_request: { sent_by_id: self.id, status: true }))
      .or(friendships.where(friend_sent: { sent_to_id: self.id, status: true })
      .or(friendships.where(friend_sent: { sent_by_id: self.id, status: true }))).distinct
  end

  # Checking if the user has an avatar attached to it.
  def has_avatar?
    self.avatar.attached?
  end

  # It's a method that returns the id of the conversation user.
  def correct_conversation_user(conversation)
    conversation_user = ConversationUser.where(conversation_id: conversation.id, user_id: self.id)
    conversation_user.first.id if conversation_user.present?
  end

  # It's a method that returns the first conversation user.
  def conversation_user_first
    self.conversation_users.find_by_user_id(self.id)
  end

end