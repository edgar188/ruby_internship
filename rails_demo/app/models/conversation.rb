class Conversation < ApplicationRecord
  include Modules::Conversation

  belongs_to :sender, class_name: :User, foreign_key: 'sender_id'
  belongs_to :receiver, class_name: :User, foreign_key: 'recipient_id'
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :recipient_id

end