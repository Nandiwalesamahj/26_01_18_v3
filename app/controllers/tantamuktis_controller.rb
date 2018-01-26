class TantamuktisController < ApplicationController


	def new
		@tantamukti = Tantamukti.new
	end

	def create
		@tantamukti = Tantamukti.new(tantamukti_params)
		@tantamukti.user_id = current_user.id
		if user_signed_in?
			if @tantamukti.save
				current_user.tanta_mukti_created = "Yes"
				current_user.save
				AllMailer.tanta_new(@tantamukti).deliver_now
				redirect_to tanta_mukti_samiti_home_path
			end
		end
	end

	def edit
		@tantamukti = Tantamukti.find(params[:id])
	end

	def update
		@tantamukti = Tantamukti.find(params[:id])
		if user_signed_in?
			if @tantamukti.update(tantamukti_params)
				redirect_back(fallback_location: tanta_mukti_samiti_home_path)
			end
		end
	end
	
	def destroy
		@tantamukti = Tantamukti.find(params[:id])
		if user_signed_in?
			if @tantamukti.destroy
				current_user.tanta_mukti_created = "No"
				current_user.save
				redirect_back(fallback_location: tanta_mukti_samiti_home_path)
			end
		end
	end

	private
	def tantamukti_params
		params.require(:tantamukti).permit(:user_id,:user_name,:post,:work_field,:photo,:phone_number,:tantamukti_approval,:address)
	end
end