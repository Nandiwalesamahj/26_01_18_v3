class AdvertisesController < ApplicationController
  before_action :set_advertise, only: [:show, :edit, :update, :destroy]

  def index
    @advertises = Advertise.all.order("created_at DESC")
  end

  def new
    @advertise = Advertise.new
  end

  def edit
  end

  def create
    @advertise = Advertise.new(advertise_params)
      if @advertise.save
        redirect_to advertises_path
    end
  end


  def update
      if @advertise.update(advertise_params)
        redirect_to advertises_path
      end
  end

  def destroy
    if @advertise.destroy
      redirect_to advertises_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertise
      @advertise = Advertise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertise_params
      params.require(:advertise).permit(:title, :description, :photo, :on_page)
    end
end
