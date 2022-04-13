class Admin < ActiveRecord::Base
  # Include default devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # Include User modules
  include Modules::User

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, maximum: 255

end
