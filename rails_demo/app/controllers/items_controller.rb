class ItemsController < ApplicationController

  before_action :set_items, only: [:index, :search]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      flash[:msg] = { message: @item.errors.full_messages }
      render :new, status: :bad_request
    end
  end

  def update
    # Get options array
    # @item.options = { options: params.require(:options) }

    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Item was successfully updated.'
    else
      flash[:msg] = { message: @item.errors.full_messages }
      render :edit, status: :bad_request
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item was successfully destroyed.'
  end

  def search
    render json: @items, status: :ok
  end

  private

  def item_params
    params.require(:item).permit(
      :category_id,
      :owner_type,
      :owner,
      :title,
      :description,
      :price,
      :countity,
      :ratting,
      :state,
      :options,
      images: []
    )
  end  

  def set_items
    @items = Item.paginate_data(params)
  end

  def set_item
    @item = Item.find_by_id(params[:id])
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found if @item.nil?
  end

  # Checking if the current user is the owner of the category.
  def correct_user
    @item = Item.find_by_id(params[:id])
    unless current_user?(@item.owner.id)
      redirect_to items_path, alert: 'You are not allowed to update this item.'
    end
  end
  
end