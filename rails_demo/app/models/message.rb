class Message < ApplicationRecord
  include Validations::Message
  include Modules::Message

  belongs_to :conversation
  belongs_to :conversation_user
  has_many_attached :attachments, dependent: :destroy

  before_validation :set_additional_info, on: :create

  validates_presence_of :conversation_id, :conversation_user_id, :additional_info
  validates_presence_of :text, unless: -> { self.attachments.attached? }
  validate :attachments_type

end