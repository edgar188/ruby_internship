class DistrictsController < ApplicationController
  before_action :set_district, only: %i[update show destroy edit]

  def index
    @districts = District.all
  end

  def show
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)

    respond_to do |format|
      if @district.save  
        format.html { redirect_to districts_path(@district), notice: 'district was successfully created.' }
        format.json { render :show, status: :created, location: @district }
      else
        format.html { render :new }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @district.update(district_params)
    redirect_to district_path(@district)
  end

  def destroy
    @district.destroy
    redirect_to districts_path
  end

  private

  def district_params
    params.require(:district).permit(:name, :phone, :mailing_address, :notes, :status )
  end

  def set_district
    ## Get district by id
    @district = District.find(params[:id])
  end
  
end
