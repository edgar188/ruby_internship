class ConversationsController < ApplicationController

  before_action :set_conversation, only: [:create]

  def create
    @conversation = Conversation.new(conversation_params) if @conversation.nil?

    if @conversation.save
      return redirect_to conversation_messages_path(@conversation)
    end

    redirect_to root_path, alert: t(:wrong)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def set_conversation
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    end
  end

end