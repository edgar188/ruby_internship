class Api::V1::CategoriesController < Api::V1::ApplicationController

  before_action :set_category, only: [:show, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy], if: :logged_in_user

  def index
    @categories = Category.paginate_data(all: true)
  end

  def show
    @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    unless @category.save
      return render json: { errors: @category.errors }, status: :bad_request
    end

    render :show, status: :created
  end

  def update
    unless @category.update(category_params)
      return render json: { errors: @category.errors }, status: :bad_request
    end

    render :show, status: :ok
  end

  def destroy
    unless @category.destroy
      return render json: { error: @user.errors }, status: :bad_request
    end

    render json: { message: I18n.t(:destroyed, obj: 'Category') }, status: :ok
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(
      :name,
      :parent_id,
      :owner,
      options: []
    )
  end

  def check_correct_user
    unless @category.correct_user?
      render json: { error:  I18n.t(:not_allowed, obj: 'Category') }, status: :bad_request
    end
  end

end