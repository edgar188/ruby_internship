class Api::V1::CategoriesController < Api::V1::ApplicationController
  
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def index
    @categories = Category.paginate_data(all: true)[:result]
  end

  def show
    @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    return render json: @category.errors, status: :bad_request unless @category.save
    render json: @category, status: :created, location: @category 
  end

  def update
    return render json: @category.errors, status: :bad_request unless @category.update(category_params)
    @category
  end

  def destroy
    @category.destroy
  end

  private
  
  def set_category
    @category = Category.find_by_id!(params[:id])
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