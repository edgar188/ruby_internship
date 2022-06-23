module Modules::Conversation
  extend ActiveSupport::Concern

  included do
    scope :with_current, ->  (current_user) { ConversationUser.where(user: current_user) }
  end

  class_methods do
    def paginate_data(params)
      conversations = Conversation.all

      conversations = conversations.paginate(
        page: params[:page] || Modules::Constants::PAGE,
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Helpers::to_boolean(params[:all])

      conversations = { result: conversations, count: count }
      conversations
    end

    # A class method that is used to find a conversation between two users.
    def between(current_user, interlocutor)
      Conversation.where(name: "#{current_user.email} / #{interlocutor}")
      .or(Conversation.where(name: "#{interlocutor} / #{current_user.email}")).first
    end
  end

  # Setting the creator of the conversation.
  def set_creator
    self.assign_attributes(
      creator: {
        id: ApplicationRecord.class_variable_get(:@@logged_in_user).id,
        full_name: ApplicationRecord.class_variable_get(:@@logged_in_user).show_full_name
      }
    )
  end

  # Creating the initial members of the conversation.
  def create_initial_members(current_user, interlocutor)
    ConversationUser.create(conversation_id: self.id, user_id: current_user.id)

    if self.dual?
      ConversationUser.create(conversation_id: self.id, user_id: interlocutor)
    end
  end

  def show_creator_name
    self.creator['full_name']
  end

  def member?(user)
    self.conversation_users.map{ |u| u.user }.pluck(:id).include?(user.id)
  end

end