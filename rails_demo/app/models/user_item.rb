class UserItem < ApplicationRecord
  include Modules::UserItem

  belongs_to :user
  belongs_to :item

  after_update do
    current = ApplicationRecord.class_variable_get(:@@logged_in_user)
    current.balance -= self.item.price
    current.save 
  end

end