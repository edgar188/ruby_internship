class CategoriesController < ApplicationController

  before_action :set_categories, only: [:index]
  before_action :set_category, only: [:show]

  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    
    @category = Category.new(category_params)
    
    # Get options array
    @category.options = { options: params.require(:options) }

    if @category.save
      redirect_to @category, notice: "Category was successfully Created."
    else
      render :new, status: :bad_request
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name, 
      :parrent_id, 
      :owner,
      :options
    )

  end  

  def set_categories
    @categories = Category.paginate_data(params)
  end

  def set_category
    @category = Category.find_by_id(params[:id])
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found if @category.nil?
  end

end