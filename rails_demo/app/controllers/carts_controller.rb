class CartsController < ApplicationController

  def index
  end

  def new
  end
  
  def create
  end

  private
  
  def cart_params
  params.require(:cart).permit(
    :user_id,
    :product_id,
    :ordered_at
  )
  end
	  
end