class Api::V1::UsersController < Api::V1::ApplicationController
  
  before_action :set_user, only: [:show]
  before_action :set_logged_in_user, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def update
    return @user if @user.update(user_params)
    render json: @user.errors, status: :bad_request
  end

  def destroy
    return @user.destroy
    render json: @user.errors, status: :forbidden
  end 

  private

  def set_user
    @user = User.find_by_id!(params[:id])
  end

  def set_logged_in_user
    @user = User.find_by_id!(params[:id])

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