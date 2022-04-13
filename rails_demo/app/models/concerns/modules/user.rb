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
  
  class_methods do
    # ..............
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
