class SamajikplacesController < ApplicationController
	

	
	def new
		@samajikplace = Samajikplace.new
	end

	def create
		@samajikplace = Samajikplace.new(samajik_place_params)
		if current_user.user_type == "Super_admin"
			if @samajikplace.save
				redirect_to dharmik_places_home_path
			end
		end
	end

	def edit
		@samajikplace = Samajikplace.find(params[:id])
	end

	def update
		@samajikplace = Samajikplace.find(params[:id])
		if current_user.user_type == "Super_admin"
			if @samajikplace.update(samajik_place_params)
				redirect_to dharmik_places_home_path
			end
		end
	end

	def destroy
		@samajikplace = Samajikplace.find(params[:id])
		if @samajikplace.destroy
			redirect_to dharmik_places_home_path
		end
	end

	private
	def samajik_place_params
		params.require(:samajikplace).permit(:title,:description,:photo,:attachment,:place,:address,:user_id)
	end
end
