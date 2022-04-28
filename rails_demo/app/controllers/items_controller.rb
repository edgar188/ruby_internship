class ItemsController < ApplicationController

  before_action :set_items, only: [:index, :search]
  before_action :set_categories, only: [:new, :create]
  before_action :set_correct_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
  end

  def show
  end

  def new
    redirect_to root_path if current_user.role == :buyer
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.options = params.require(:options)

    if @item.save
      redirect_to root_path, notice: t(:created, obj: 'Item')
    else
      flash[:msg] = { message: @item.errors.full_messages }
      render :new, status: :bad_request
    end
  end

  def update
    @item.options = params.require(:options)

    if @item.update(item_params)
      redirect_to item_path(@item), notice: t(:updated, obj: 'Item')
    else
      flash[:msg] = { message: @item.errors.full_messages }
      render :edit, status: :bad_request
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: t(:destroyed, obj: 'Item')
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

  def set_categories
    @categories = Category.paginate_data(params)
  end

  def set_correct_user
    @item = Item.find_by_id(params[:id])

    unless @item.correct_user?
      redirect_to items_path, alert: t(:not_allowed, obj: 'Item')
    end
    
  end
  
end