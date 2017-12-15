class ShaskiyayojanasController < ApplicationController


	def new
		@shaskiyayojana = Shaskiyayojana.new
	end
	def index
		@ads = Advertise.where(:on_page => "shaskiya_yojana_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.shaskiyayojana_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@shaskiyayojanas =Shaskiyayojana.all.order("created_at DESC")
	end
	def create
		@shaskiyayojana = Shaskiyayojana.new(shaskiyayojana_params)
		@shaskiyayojana.user_id = current_user.id
		if current_user.user_type = "Super_admin"
			if @shaskiyayojana.save
				redirect_to shaskiyayojanas_path
			end
		end
	end
	def edit
		@shaskiyayojana = Shaskiyayojana.find(params[:id])
	end
	def update
		@shaskiyayojana = Shaskiyayojana.find(params[:id])
		if current_user.user_type = "Super_admin"
			if @shaskiyayojana.update(shaskiyayojana_params)
				redirect_to shaskiyayojanas_path
			end
		end
	end
	def destroy
		@shaskiyayojana = Shaskiyayojana.find(params[:id])
		if current_user.user_type = "Super_admin"
			if @shaskiyayojana.destroy
				redirect_to shaskiyayojanas_path
			end
		end
	end
	def download_file_shaskiyayojana
		    @document = Shaskiyayojana.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
	end

	private
	def shaskiyayojana_params
		params.require(:shaskiyayojana).permit(:title,:description,:user_id,:photo,:attachment)
	end
end