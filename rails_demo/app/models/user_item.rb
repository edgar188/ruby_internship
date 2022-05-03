class UserItem < ApplicationRecord
  include Validations::UserItem
  include Modules::UserItem

  belongs_to :user
  belongs_to :item

  before_update :pay

  validate :validate_balance, on: :update

end