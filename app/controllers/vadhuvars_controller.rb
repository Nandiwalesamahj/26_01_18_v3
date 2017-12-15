class VadhuvarsController < ApplicationController

	def new
		@vadhuvar = Vadhuvar.new
	end
	def index
		@vadhuvars_female = Vadhuvar.where(:gender => "स्त्री").order("created_at DESC")
		@vadhuvars_male = Vadhuvar.where(:gender => "पुरूष").order("created_at DESC")
	end
	def create
		@vadhuvar = Vadhuvar.new(vadhuvar_params)
		@vadhuvar.user_id = current_user.id
			if @vadhuvar.save
				current_user.vadhuvar_created = "Yes"
				current_user.save
				redirect_back(fallback_location: vadhuvar_home_path)
			end
		
	end
	def edit
		@vadhuvar = Vadhuvar.find(params[:id])
	end
	def update
		@vadhuvar = Vadhuvar.find(params[:id])
		if current_user .id == @vadhuvar.user_id || current_user.user_type == "Super_admin"
			if @vadhuvar.update(vadhuvar_params)
				redirect_back(fallback_location: vadhuvar_home_path)
			end
		end
	end
	def destroy
		@vadhuvar = Vadhuvar.find(params[:id])
		if current_user.id == @vadhuvar.user_id
			if @vadhuvar.destroy
				current_user.vadhuvar_created = "No"
				current_user.save
				redirect_back(fallback_location: vadhuvar_home_path)
			end
		end
	end

	private
	def vadhuvar_params
		params.require(:vadhuvar).permit(:vadhuvar_name,:birth_date,:height,:weight,:education,:blood_group,:phone_number,:expecations,:salary,:occupation,:father_name,:mother_name,:uncle_name,:address,:sub_caste,:photo,:bio,:vadhuvar_approval,:user_id,:gender)
	end
end


