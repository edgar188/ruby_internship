module Modules::ConversationUser
  extend ActiveSupport::Concern

  class_methods do
    def paginate_data(params)
      conversation_users = self.all

      conversation_users = conversation_users.paginate(
        page: params[:page] || Modules::Constants::PAGE,
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Helpers::to_boolean(params[:all])

      conversation_users = { result: conversation_users, count: count }
      conversation_users
    end
  end

  def full_name
    self.user.show_full_name
  end

  # Checking if the user is the owner of the room.
  def room_owner?
    conversation = Conversation.find_by_id(self.conversation_id)
    conversation.creator['id'] == ApplicationRecord.class_variable_get(:@@logged_in_user).id
  end

end