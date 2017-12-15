class VisionsController < ApplicationController

	def new
		@vision = Vision.new
	end
	def create
		@vision = Vision.new(vision_params)
		if current_user.user_type == "Super_admin"
			if @vision.save
				redirect_to future_vision_home_path
			end
		end
	end
	def edit
		@vision = Vision.find(params[:id])
	end
	def update
		@vision = Vision.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @vision.update(vision_params)
				redirect_to future_vision_home_path
			end
		end
	end
	def destroy
		@vision = Vision.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @vision.destroy
				redirect_to future_vision_home_path
			end
		end
	end
	def download_file_vision
		    @document = Vision.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
		end

	private
	def vision_params
		params.require(:vision).permit(:title,:description,:user_id,:attachment)
	end
end

