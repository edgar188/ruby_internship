class Api::V1::FriendshipsController < Api::V1::ApplicationController
  before_action :user?
  before_action :set_friendship, only: %i[accept decline]

  def create
    @friendship = Friendship.new(sent_by_id: logged_in_user.id, sent_to_id: params[:user_id])

    unless @friendship.save
      return render json: { errors: @friendship.errors }, status: :bad_request
    end

    render json: { message: I18n.t(:friend_request, action: :Sent) }, status: :created
  end

  def accept
    @friendship.status = true

    unless @friendship.save
      return render json: { errors: @friendship.errors }, status: :bad_request
    end

    render json: { message: I18n.t(:friend_request, action: :Accepted) }, status: :ok
  end

  def decline
    unless @friendship.destroy
      return render json: { errors: @friendship.errors }, status: :bad_request
    end

    render json: { message: I18n.t(:friend_request, action: :Declined) }, status: :ok
  end

  private

  def set_friendship
    @friendship = Friendship.find_by(sent_by_id: params[:user_id], sent_to_id: logged_in_user.id, status: false)
    return render json: { errors: I18n.t(:not_found) }, status: :not_found if @friendship.nil?
  end

end