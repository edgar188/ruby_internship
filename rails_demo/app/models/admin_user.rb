class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  include Modules::AdminUser

  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, maximum: 255
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
