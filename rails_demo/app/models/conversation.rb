class Conversation < ApplicationRecord
  include Modules::Conversation

  has_many :conversation_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  before_validation :set_creator, on: :create

  validates_presence_of :name, :chat_type, :creator
  validates_uniqueness_of :name

  enum chat_type: {
    dual: 0,
    room: 1
  }

end