module Modules::Message
  extend ActiveSupport::Concern

  class_methods do
    def paginate_data(params)
      messages = Message.all

      messages = messages.paginate(
        page: params[:page] || Modules::Constants::PAGE,
        per_page: params[:per_page] || Modules::Constants::PER_PAGE
      ) unless Modules::Helpers::to_boolean(params[:all])

      messages = { result: messages, count: count }
      messages
    end
  end

  def show_owner_name
    self.additional_info['full_name']
  end

  # A method that returns the date in a long ordinal format.
  def show_time
    self.created_at.to_s(:long_ordinal)
  end

  # Checking if the conversation_user is the logged in user and it will show the messages.
  def show_current_user_messages
    self.text.present? && self.conversation_user.present? && self.conversation_user.user == ApplicationRecord.class_variable_get(:@@logged_in_user)
  end

  # Checking if the message has text and if it does, it will show the messages.
  def show_interlocutor_messages
    self.text.present?
  end

  # Setting the additional info for the message.
  def set_additional_info
    self.assign_attributes(
      additional_info: {
        user_id: ApplicationRecord.class_variable_get(:@@logged_in_user).id,
        full_name: ApplicationRecord.class_variable_get(:@@logged_in_user).show_full_name
      }
    )
  end

end