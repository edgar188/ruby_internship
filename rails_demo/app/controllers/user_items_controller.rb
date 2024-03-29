class UserItemsController < ApplicationController
  before_action :set_user_item, only: %i[edit update destroy]
  before_action :set_card_user_items, only: [:index]
  before_action :set_order_history_user_items, only: [:order_history]

  def index; end

  def edit; end

  def order_history; end

  def show
    redirect_to user_items_path
  end

  def new
    @user_item = UserItem.new
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

    redirect_to user_item_path, alert: @user_item.errors.full_messages
  end

  def destroy
    if @user_item.ordered_at.present?
      return redirect_to user_item_path, alert: t(:not_destroyed)
    end

    @user_item.destroy
    redirect_to user_item_path
  end

  def buy_all
    service = UserItem::OrderCreator.new(current_user)
    result = service.call

    if result.success?
      return redirect_to user_items_path, notice: t(:success)
    end

    redirect_to user_items_path, alert: result.errors
  end

  def delete_all
    if current_user.not_ordered_items.destroy_all
      return redirect_to user_items_path, notice: t(:destroyed, obj: 'User items')
    end

    redirect_to user_items_path, alert: t(:not_destroyed)
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

  def set_card_user_items
    @user_items = current_user.user_items.paginate_data(params.merge(not_ordered: true))
  end

  def set_order_history_user_items
    @user_items = current_user.user_items.paginate_data(params.merge(ordered: true))
  end

end