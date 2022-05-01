class UserItemsController < ApplicationController

  before_action :set_user_item, only: [:edit, :update, :destroy]

  def index
    @user_items = current_user.user_items.paginate_data_ordered(params)
  end

  def show
    @user_items = current_user.user_items.paginate_data_not_ordered(params)
    @my_balance = current_user.balance 
  end

  def new
    @user_item = UserItem.new
  end

  def edit
  end

  def create
    @user_item = UserItem.new(user_item_params)
      
    if @user_item.save
      redirect_to root_path
    else
      render :new, status: :bad_request
    end
  end

  def update
    if @user_item.update(user_item_params)
      redirect_to user_item_path
    else
      flash[:msg] = { message: @user_item.errors.full_messages }
      render :edit, status: :bad_request
    end
  end

  def destroy
    if @user_item.ordered_at.present?
      return redirect_to user_item_path, alert: t(:not_destroyed)
    end
    
    @user_item.destroy
    redirect_to user_item_path
  end

  private
  
  def user_item_params
  params.require(:user_item).permit(
    :user_id,
    :item_id,
    :ordered_at
  )
  end

  def set_user_item
    @user_item = current_user.user_items.find(params[:id])
  end
	  
end