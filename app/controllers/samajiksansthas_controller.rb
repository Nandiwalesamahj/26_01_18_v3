class SamajiksansthasController < ApplicationController

	def index
		@ads = Advertise.where(:on_page => "samajik_sanstha_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.samajiksanstha_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@samajiksansthas = Samajiksanstha.all.order("created_at DESC")
	end

	def new
		@samajiksanstha = Samajiksanstha.new
	end
	def create
		@samajiksanstha = Samajiksanstha.new(samajiksanstha_params)
		@samajiksanstha.user_id = current_user.id
		if current_user.user_type == "Super_admin"
			if @samajiksanstha.save
			redirect_to samajiksansthas_path
			end
		end
	end
	def edit
		@samajiksanstha = Samajiksanstha.find(params[:id])
	end
	def update
		@samajiksanstha = Samajiksanstha.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @samajiksanstha.update(samajiksanstha_params)
			redirect_to samajiksansthas_path
			end
		end
	end
	def destroy
		@samajiksanstha = Samajiksanstha.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @samajiksanstha.destroy
			redirect_to samajiksansthas_path
			end
		end
	end
	def download_file_samajiksanstha
		    @document = Samajiksanstha.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
	end
	private
	def samajiksanstha_params
		params.require(:samajiksanstha).permit(:title,:description,:user_id,:photo,:attachment)
	end
end
