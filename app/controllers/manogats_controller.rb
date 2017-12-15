class ManogatsController < ApplicationController
	
	
		def new
			@manogat = Manogat.new
		end
		def create
			@manogat = Manogat.new(manogat_params)
			if current_user.user_type == "Super_admin"
			if @manogat.save
				redirect_to homepage_path
			end
			end
		end
		def edit
			@manogat = Manogat.find(params[:id])
		end
		def update
			@manogat = Manogat.find(params[:id])
			if current_user.user_type == "Super_admin"
			if @manogat.update(manogat_params)
				redirect_to homepage_path
			end
			end
		end
		def destroy
			@manogat = Manogat.find(params[:id])
			if current_user.user_type == "Super_admin"
			if @manogat.destroy
				redirect_to homepage_path(current_user)
			end
			end
		end
		def download_file_manogat
		    @document = Manogat.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
		end
	
	private
	def manogat_params
		params.require(:manogat).permit(:user_name, :description,:photo,:attachment)
	end
end
