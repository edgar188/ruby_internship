class Api::V1::NotificationsController < Api::V1::ApplicationController

  before_action :is_user?
  before_action :set_notification, only: [:destroy]
  before_action :check_correct_user, only: [:destroy]

  def index
    @notifications = Notification.paginate_data(all: true)
  end

  def destroy
    unless @notification.destroy
      return render json: { errors: I18n.t(:not_destroyed) }, status: :bad_request
    end

    render json: { message: I18n.t(:destroyed, obj: 'Notification') }, status: :ok
  end

  def delete_all
    unless logged_in_user.notifications.delete_all
      return render json: { errors: I18n.t(:not_destroyed) }, status: :bad_request
    end

    render json: { message: I18n.t(:destroyed, obj: 'Notifications') }, status: :ok
  end

  private

  def set_notification
    @notification = Notification.find_by_id(params[:id])
    return render json: { errors: I18n.t(:not_found) }, status: :not_found if @notification.nil?
  end

  def check_correct_user
    unless @notification.user_id == logged_in_user.id
      render json: { errors: I18n.t(:not_allowed, obj: 'Notification') }, status: :bad_request
    end
  end

end