class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include Modules::Admin

  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, maximum: 255
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
