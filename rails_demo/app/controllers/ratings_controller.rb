class RatingsController < ApplicationController

  def new
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      redirect_to root_path
    end
  end

  private

  def rating_params
    params.require(:rating).permit(
      :user_id,
      :item_id,
      :value,
    )
  end  
end