class Api::V1::FriendshipsController < Api::V1::ApplicationController

  before_action :is_user?
  before_action :set_friendship, only: [:accept_friend, :decline_friend]

  def create
    @friendship = Friendship.new(sent_by_id: logged_in_user.id, sent_to_id: params[:user_id])
    return render json: { error: @friendship.errors }, status: :bad_request unless @friendship.save
    render json: { message: I18n.t(:friend_request, action: 'Sent') }, status: :ok
  end

  def accept_friend
    @friendship.status = true
    return render json: { error: @friendship.errors }, status: :bad_request unless @friendship.save
    render json: { message: I18n.t(:friend_request, action: 'Accepted') }, status: :ok
    @friendship2 = Friendship.new(sent_by_id: logged_in_user.id, sent_to_id: params[:user_id], status: true)
    @friendship2.save
  end

  def decline_friend
    return render json: { error: @friendship.errors }, status: :bad_request unless @friendship.destroy
    render json: { message: I18n.t(:friend_request, action: 'Declined') }, status: :ok
  end

  private

  def set_friendship
    @friendship = Friendship.find_by(sent_by_id: params[:user_id], sent_to_id: logged_in_user.id, status: false)
    return render json: { error: I18n.t(:not_found) }, status: :not_found if @friendship.nil?
  end

  def is_user?
    return render json: { error: I18n.t(:is_user) } if logged_in_admin.present?
  end

end