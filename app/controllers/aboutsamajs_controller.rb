class AboutsamajsController < ApplicationController
	

	def index
		@ads = Advertise.where(:on_page => "samaja_vishayi_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.aboutsamaj_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@about_samajs = Aboutsamaj.all.order("created_at DESC")
	end
	def show
		@about_samaj = Aboutsamaj.find(params[:id])
	end

	def new
		@about_samaj = Aboutsamaj.new
	end

	def create
		@about_samaj = Aboutsamaj.new(about_samaj_params)
		@about_samaj.user_id = current_user.id
		if @about_samaj.save
			redirect_to aboutsamajs_path
		end
	end

	def edit
		@about_samaj = Aboutsamaj.find(params[:id])
	end

	def update
		@about_samaj = Aboutsamaj.find(params[:id])
		if @about_samaj.update(about_samaj_params)
			redirect_to aboutsamajs_path
		end
	end

	def destroy
		@about_samaj = Aboutsamaj.find(params[:id])
		if @about_samaj.destroy
			redirect_to aboutsamajs_path
		end
	end
	def download_file_aboutsamaj
		    @document = Aboutsamaj.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
	end
	private
	def about_samaj_params
		params.require(:aboutsamaj).permit(:title,:description,:user_id,:photo,:attachment)
	end
end
