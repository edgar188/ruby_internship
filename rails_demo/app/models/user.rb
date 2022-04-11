class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  auto_strip_attributes :first_name, :last_name, :email, :phone,  squish: true

  validates_presence_of :first_name, :last_name
  validates :first_name, :last_name, length: { maximum: 255 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  
  enum gender: {
    no_select: 0,
    male: 1,
    female: 2
  }

  enum role: {
    seller: 1,
    buyer: 2
  }

  GENDER = {
    no_select: 'No select',
    male: 'Male',
    female: 'Female'
  }

  ROLE = {
    seller: 'Seller',
    buyer: 'Buyer'
  }

end
