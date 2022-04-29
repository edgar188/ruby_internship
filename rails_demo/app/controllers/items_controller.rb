class ItemsController < ApplicationController

  before_action :set_items, only: [:index, :search]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
  end

  def show
  end

  def new
    redirect_to root_path if @logged_in_user.role == 'buyer'
    @categories = Category.paginate_data(params)
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.options = params.require(:options)

    if @item.save
      redirect_to root_path, notice: t('created', obj: 'Item')
    else
      flash[:msg] = { message: @item.errors.full_messages }
      render :new, status: :bad_request
    end
  end

  def update
    @item.options = params.require(:options)

    if @item.update(item_params)
      redirect_to item_path(@item), notice: t('updated', obj: 'Item')
    else
      flash[:msg] = { message: @item.errors.full_messages }
      render :edit, status: :bad_request
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: t('destroyed', obj: 'Item')
  end

  def search
    render json: @items, status: :ok
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
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

  def correct_user
    @item = Item.find_by_id(params[:id])
    unless @logged_in_user.id == @item.owner.id
      redirect_to items_path, alert: t('not_allowed', obj: 'Item')
    end
  end

end