class ConversationUsersController < ApplicationController

  before_action :set_conversation

  def create
    @conversation_user = ConversationUser.new(conversation_user_params)

    if @conversation_user.save
      return redirect_to conversation_messages_path(@conversation)
    end

    redirect_to root_path, alert: t(:wrong)
  end

  def add_member
    service = ConversationUser::AddMember.new(params[:conversation_id], params[:user_id])
    result = service.call

    if result.success?
      return redirect_to conversation_messages_path(@conversation), notice: t(:success)
    end

    redirect_to conversation_messages_path(@conversation), alert: t(:wrong)
  end

  private

  def conversation_user_params
    params.permit(:conversation_id, :user_id)
  end

  def set_conversation
    @conversation = Conversation.find_by_id(params[:conversation_id])
  end

end