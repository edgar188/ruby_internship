class Api::V1::UsersController < Api::V1::ApplicationController

  before_action :set_user, only: [:show]
  before_action :set_logged_in_user, only: [:update, :destroy]

  def index
    @users = User.paginate_data(all: true)
  end

  def show
  end

  def new
    @user = User.new
  end

  def update
    unless @user.update(user_params)
      return render json: @user.errors, status: :bad_request
    end

    render :show, status: :ok
  end

  def destroy
    unless @user.destroy
      return render json: { error: @user.errors }, status: :bad_request
    end

    render json: { message: I18n.t(:destroyed, obj: 'User') }, status: :ok
  end

  def current
    @is_admin = !!logged_in_admin
    @logged_in = logged_in_user.present? ? logged_in_user : logged_in_admin
    @friends = logged_in_user.friends if logged_in_user.present?
    @pending_requests = logged_in_user.pending_requests if logged_in_user.present?
    @received_requests = logged_in_user.received_requests if logged_in_user.present?
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_logged_in_user
    @user = User.find(params[:id])

    unless @user == logged_in_user
      render json: {error: I18n.t(:not_allowed, obj: 'User')}, status: :bad_request
    end
  end

  def user_params
    params.require(:user).permit(
      :role,
      :first_name,
      :last_name,
      :email,
      :gender,
      :birth_date,
      :country,
      :phone,
      :avatar
      )
  end

end