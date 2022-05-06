class UserItem < ApplicationRecord
  include ActiveModel::Dirty
  include Validations::UserItem
  include Modules::UserItem

  belongs_to :user
  belongs_to :item, -> { with_deleted }

  before_update :pay

  validate :validate_balance, on: :update
  validate :validate_ordered_at, on: :update

end