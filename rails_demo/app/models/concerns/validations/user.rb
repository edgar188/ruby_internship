module Validations::User
  extend ActiveSupport::Concern

  private

  # It checks if the role is buyer or seller.
  def validate_role
    unless self.role.to_sym == :buyer || self.role.to_sym == :seller 
      self.errors.add(:role, I18n.t(:wrong_role))
    end
  end

  # It checks if the gender is male, female or no_select.
  def validate_gender
    unless self.gender.to_sym == :no_select || self.gender.to_sym == :male || self.gender.to_sym == :female 
      self.errors.add(:gender, I18n.t(:wrong_gender))
    end
  end

  # It checks if the birth_date is a Date object and if the birth_date is less than 10 years ago.
  def validate_birth_date
    unless self.birth_date.is_a?(Date)
      errors.add(:birth_date, I18n.t(:wrong_birth_date))
    end

    if self.birth_date > 10.years.ago.to_date
      errors.add(:birth_date, I18n.t(:wrong_age))
    end
  end

  # It checks if the country is in the list of countries.
  def validate_country
    countries = ['No select', 'Armenia', 'Russia', 'USA', 'UK']
    
    if countries.exclude?(self.country)
      self.errors.add(:country, I18n.t(:wrong_country))
    end
  end
  
end