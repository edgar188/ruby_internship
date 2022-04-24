class CategoriesController < ApplicationController

  before_action :set_categories, only: [:index, :search]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

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
      redirect_to @category, notice: 'Category was successfully created.'
    else
      flash[:msg] = { message: @category.errors.full_messages }
      render :new, status: :bad_request
    end
  end

  def update

    if @category.update(category_params)
      redirect_to category_path(@category), notice: 'Category was successfully updated.'
    else
      flash[:msg] = { message: @category.errors.full_messages }
      render :edit, status: :bad_request
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  def search
    render json: @categories, status: :ok
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

  # Checking if the current user is the owner of the category.
  def correct_user
    @category = Category.find_by_id(params[:id])
    unless current_user?(@category.owner['id'])
      redirect_to categories_path, alert: 'You are not allowed to update this category.'
    end
  end
  
end