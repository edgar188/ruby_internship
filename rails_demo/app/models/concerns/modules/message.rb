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

  def show_time
    self.created_at.to_s(:long_ordinal)
  end

  # Get user avatar path
  def as_json(options)
    path = '/assets/avatar-4968360c5b8ec9fa389ed9b7ed24363327ba80696915986c7b29f6c65a2641d0.png'

    if User.find_by_id(self.additional_info['user_id']).has_avatar?
      path = Rails.application.routes.url_helpers.rails_blob_path(User.find_by_id(self.additional_info['user_id']).avatar, only_path: true)
    end

    super(options).merge(user_avatar_url: path)
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