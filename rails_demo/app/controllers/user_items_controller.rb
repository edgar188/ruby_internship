class UserItemsController < ApplicationController

  before_action :set_user_item, only: [:edit, :update, :destroy]

  def index
    @user_items = current_user.user_items.paginate_data(params.merge(ordered: 'on'))
  end

  def show
    @user_items = current_user.user_items.paginate_data(params.merge(not_ordered: 'on'))
  end

  def new
    @user_item = UserItem.new
  end

  def edit
  end

  def create
    @user_item = UserItem.new(user_item_params)
      
    if @user_item.save
      return redirect_to root_path
    end

    render :new, status: :bad_request
  end

  def update
    if @user_item.update(user_item_params)
      return redirect_to user_item_path
    end

    redirect_to user_item_path, alert: t(:negative_balance)
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