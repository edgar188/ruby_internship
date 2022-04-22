class Category < ApplicationRecord
  include Modules::Category
  
  belongs_to :parrent, class_name: :Category, optional: true
  has_many :childs, class_name: :Category, foreign_key: :parrent_id, dependent: :destroy
  has_many :items, dependent: :destroy
  
  before_validation :teest, on: :create

  def teest
    user = Current.user

    self.assign_attributes(
      owner: {
        id: user.id, 
        type: user.class.name, 
        full_name: user.show_full_name 
      }
    )
  end

end
