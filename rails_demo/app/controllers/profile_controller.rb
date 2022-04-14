class ProfileController < ApplicationController

  def index
  end

  def edit
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_page_path, notice: 'Your account has been updated successfully.'
    else
      flash[:msg] = { message: @user.errors.full_messages }
      render :edit
    end
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
      :avatar, 
      :password
      )
  end
  
end