class LandingController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.paginate_data(params)
    @categories = Category.paginate_data(params) 
    @root_categories = @categories[:result].select { |c| c.level == 0 } 
  end

end