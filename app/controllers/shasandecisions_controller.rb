class ShasandecisionsController < ApplicationController
	
	def index
		@ads = Advertise.where(:on_page => "shasan_nirnay_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.shasannirnay_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@shasandecisions = Shasandecision.all.order("created_at DESC")
	end
	def new
		@shasandecision = Shasandecision.new
	end
	def create
		@shasandecision = Shasandecision.new(shasandecision_params)
		if current_user.user_type == "Super_admin"
			if @shasandecision.save
				redirect_to shasandecisions_path
			end
		end
	end
	def edit
		@shasandecision = Shasandecision.find(params[:id])
	end
	def update
		@shasandecision = Shasandecision.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @shasandecision.update(shasandecision_params)
				redirect_to shasandecisions_path
			end
		end
	end
	def destroy
		@shasandecision = Shasandecision.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @shasandecision.destroy
				redirect_to shasandecisions_path
			end
		end
	end
	def download_file_shasandecision
		    @document = Shasandecision.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
		end

	private
	def shasandecision_params
		params.require(:shasandecision).permit(:title,:description,:user_id,:photo,:attachment)
	end
end