class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def index
    @users = User.paginate_data(params)[:result]
  end

  def show
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

  def set_user
    @user = User.find_by_id(params[:id]) or
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found  
  end

end