class UsersController < ApplicationController

  def index
    if params[:query].present?
      @users = User.where("first_name LIKE ?", "%#{params[:query]}%").paginate(page: params[:page], per_page: 4)
    else
      @users = User.all.paginate(page: params[:page], per_page: 4)
    end
  end

  def show
    @user = User.find(params[:id])
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