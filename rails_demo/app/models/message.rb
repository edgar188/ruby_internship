class Message < ApplicationRecord
  include Validations::Message
  include Modules::Message

  belongs_to :conversation
  belongs_to :conversation_user

  before_validation :set_additional_info, on: :create

  validates_presence_of :conversation_id, :conversation_user_id, :text, :additional_info

end