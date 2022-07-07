class MessagesController < ApplicationController

  before_action :set_conversation, :set_conversation_users
  before_action :check_correct_member, only: [:index]

  def index
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)

    if @message.save
      return ConversationChannel.broadcast_to(@conversation, @message)
    end

    ConversationChannel.broadcast_to(@conversation, @message)
  end

  private

  def message_params
    params.require(:message).permit(:conversation_user_id, :conversation_id, :text, attachments: [])
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def set_conversation_users
    @conversation_users = Conversation.with_current
  end

  def check_correct_member
    unless @conversation.member?(current_user.id)
      return redirect_to root_path, alert: t(:not_found)
    end
  end

end