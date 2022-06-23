class ConversationUser < ApplicationRecord
  include Validations::ConversationUser
  include Modules::ConversationUser

  belongs_to :conversation
  belongs_to :user
  has_many :messages

  validates_presence_of :conversation_id, :user_id
  validates_uniqueness_of :user_id, scope: :conversation_id
  validate :validate_room_owner, on: :create
  validate :validate_dual_chat_members_count

end