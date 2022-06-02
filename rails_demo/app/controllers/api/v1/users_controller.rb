class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def update
    if @user == logged_in_user && @user.update(user_params)
      @user
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def destroy
    if @user == logged_in_user
      @user.destroy 
    else
      render json: @user.errors, status: :forbidden
    end
  end 

  def current
    @is_admin = !!logged_in_admin
    @logged_in = logged_in_user.present? ? logged_in_user : logged_in_admin
  end

  private

  def set_user
    @user = User.find_by_id!(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: I18n.t(:not_found, obj: 'User') }, status: :not_found
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