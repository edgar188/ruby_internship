class UsersController < ApplicationController

  before_action :set_users, only: [:index, :search]
  before_action :set_user, only: [:show]

  def index
  end

  def show
  end
  
  def search
    render json: @users, status: :ok
  end

  private

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
  
  def set_users
    @users = User.paginate_data(params)
  end

  def set_user
    @user = User.find_by_id(params[:id])
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found if @user.nil?
  end

end