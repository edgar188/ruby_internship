class MessagesController < ApplicationController

  before_action :set_conversation, :set_conversations
  before_action :check_correct_user

  def index
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)

    if @message.save
      return redirect_to conversation_messages_path(@conversation)
    end

    redirect_to conversations_path, alert: t(:wrong)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def set_conversations
    @conversations = Conversation.with_current(current_user)
  end

  def check_correct_user
    unless @conversation.recipient_id == current_user.id || @conversation.sender_id == current_user.id
      redirect_to root_path, alert: t(:not_found)
    end
  end
end