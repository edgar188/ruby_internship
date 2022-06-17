module Modules::Conversation
  extend ActiveSupport::Concern

  included do
    scope :between, -> (sender_id, recipient_id) { where({ sender_id: sender_id, recipient_id: recipient_id }).or(where({ recipient_id: sender_id, sender_id: recipient_id })) }
    scope :with_current, ->  (current_user) { where(sender_id: current_user.id).or(where(recipient_id: current_user.id)) }
  end

  class_methods do
    def paginate_data(params)
      conversations = Conversation.all

      # It's paginating the conversations list.
      conversations = conversations.paginate(
        page: params[:page] || Modules::Constants::PAGE,
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Helpers::to_boolean(params[:all])

      # Get conversations and conversations count
      conversations = { result: conversations, count: count }
      conversations
    end
  end

  # A method that returns the recipient of the message.
  def recipient(current_user)
    self.sender_id == current_user.id ? self.receiver : self.sender
  end

end