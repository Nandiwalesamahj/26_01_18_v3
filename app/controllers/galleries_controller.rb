class GalleriesController < ApplicationController
  
  def show
    @model = Gallery.find(params[:id])
  end
  def index
    @model = Gallery.new
    @models = Gallery.all.order("created_at DESC")
  end
  def create
    if current_user.user_type == "Super_admin"
     @model = Gallery.new(gallery_params)
     if @model.save
      redirect_to galleries_path
     end
    end
  end
  def destroy
    @model = Gallery.find(params[:id])
    if current_user.user_type == "Super_admin"
      if @model.destroy
        redirect_to galleries_path
      end
    end
  end
  
  private
  def gallery_params
    params.require(:gallery).permit(:photo)
  end
end
