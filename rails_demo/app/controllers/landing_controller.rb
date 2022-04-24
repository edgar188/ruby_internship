class LandingController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]

  def index
    @categories = Category.all
  end

end