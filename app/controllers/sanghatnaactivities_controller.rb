class SanghatnaactivitiesController < ApplicationController


	def new
		@sanghatnaactivity = Sanghatnaactivity.new
	end
	def create
		@sanghatnaactivity = Sanghatnaactivity.new(sanghatnaactivity_params)
		if current_user.user_type == "Super_admin"
			if @sanghatnaactivity.save
				redirect_to sanghatnaactivities_home_path
			end
		end
	end
	def edit
		@sanghatnaactivity = Sanghatnaactivity.find(params[:id])
	end
	def update
		@sanghatnaactivity = Sanghatnaactivity.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @sanghatnaactivity.update(sanghatnaactivity_params)
				redirect_to sanghatnaactivities_home_path
			end
		end
	end
	def destroy
		@sanghatnaactivity = Sanghatnaactivity.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @sanghatnaactivity.destroy
				redirect_to sanghatnaactivities_home_path
			end
		end
	end
	def download_file_sanghatnaactivity
		    @document = Sanghatnaactivity.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
	end

	private
	def sanghatnaactivity_params
		params.require(:sanghatnaactivity).permit(:title,:description,:user_id,:photo,:attachment,:event_date)
	end
end

