class ConversationsController < ApplicationController

  before_action :set_dual_conversation, only: [:create]

  def new
    @conversation = Conversation.new
  end

  def create
    ActiveRecord::Base.transaction do
      @conversation = Conversation.new(conversation_params)

      if @conversation.save
        @conversation.create_initial_members(current_user, params[:conversation][:conversation_user_id])
        return redirect_to conversation_messages_path(@conversation), notice: t(:success)
      end

      redirect_to users_path, alert: @conversation.errors.full_messages
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:name, :chat_type, :creator)
  end

  def set_dual_conversation
    @conversation = Conversation.between(current_user, params[:conversation][:interlocutor_email])

    if @conversation.present?
      return redirect_to conversation_messages_path(@conversation)
    end
  end

end