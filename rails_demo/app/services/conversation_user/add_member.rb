class ConversationUser::AddMember

  def initialize(conversation_id, user_ids)
    @conversation_id = conversation_id
    @user_ids = user_ids
  end

  def call
    ActiveRecord::Base.transaction do
      add_member()
    end

    OpenStruct.new(success?: true)
    rescue ActiveRecord::RecordInvalid => e
      OpenStruct.new(success?: false, errors: e.message)
  end

  private

  def add_member
    if @user_ids.present?
      @user_ids.each do |user_id|
        ConversationUser.create!(conversation_id: @conversation_id, user_id: user_id)
      end
    end
  end

end