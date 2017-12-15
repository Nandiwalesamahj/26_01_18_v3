class RecruitmentsController < ApplicationController


	def index
		@ads = Advertise.where(:on_page => "karmachari_bharti_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.recruitment_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@recruitments = Recruitment.all.order("created_at DESC").page(params[:page]).per_page(10)
	end
	def show
		@recruitment = Recruitment.find(params[:id])
	end
	def new
		@recruitment = Recruitment.new
	end
	def edit
		@recruitment = Recruitment.find(params[:id])
	end
	def create
		@recruitment = Recruitment.new(recruitment_params)
		if user_signed_in?
			if @recruitment.save
				redirect_to recruitments_path
			end
		end
	end

	def update
		@recruitment = Recruitment.find(params[:id])
		if user_signed_in
			if @recruitment.update(recruitment_params)
				redirect_to recruitments_path
			end
		end	
	end
	def destroy
		@recruitment = Recruitment.find(params[:id])
		if @recruitment.destroy
			redirect_to recruitments_path
		end
	end
	def download_file_recruitment
		
		    @document = Recruitment.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
		end
	private
	def recruitment_params
		params.require(:recruitment).permit(:title,:description,:attachment)
	end
end
