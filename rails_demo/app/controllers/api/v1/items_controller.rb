class Api::V1::ItemsController < Api::V1::ApplicationController

  before_action :set_item, only: [:show, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy], if: :logged_in_user

  def index
    @items = Item.paginate_data(all: true)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    unless @item.save
      return render json: { errors: @item.errors }, status: :bad_request
    end

    render :show, status: :created
  end

  def update
    unless @item.update(item_params)
      return render json: { errors: @item.errors }, status: :bad_request
    end

    render :show, status: :ok
  end

  def destroy
    unless @item.destroy
      return render json: { error: @user.errors }, status: :bad_request
    end

    render json: { message: I18n.t(:destroyed, obj: 'Item') }, status: :ok
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :category_id,
      :owner_type,
      :owner,
      :title,
      :description,
      :price,
      :countity,
      :rating,
      :state,
      options: {},
      images: [],
      item_resources_attributes: [
        :id, :name, :resource_type, :url, :file, :_destroy
      ]
    )
  end

  def check_correct_user
    unless @item.correct_user?
      render json: { error:  I18n.t(:not_allowed, obj: 'Item') }, status: :bad_request
    end
  end

end