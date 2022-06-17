class Message < ApplicationRecord
  include Validations::Message
  include Modules::Message

  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id
  validate :validate_members

end