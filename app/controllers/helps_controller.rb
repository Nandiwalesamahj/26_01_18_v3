class HelpsController < ApplicationController


	def index
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.help_summary != nil
				@summary_exist = summary_exist
				break
			end
		end

		
		@helpies = Array.new
		@helpers = Array.new
		count = 0
		count_h = 0
		@helps = Help.all.order("created_at DESC")
		if @helps != nil && @helps.size > 0
			for help in @helps
				if help.helpie_name != nil
					@helpies.insert(count,help)
					count = count + 1
				elsif help.helper_name != nil
					@helpers.insert(count_h,help)
					count_h = count_h + 1
				end
			end
		end
	end

	def show
		@helpies = Array.new
		@helpers = Array.new
		count = 0
		cunt_h = 0
		@helps = Help.all.order("created_at DESC")
		if @helps != nil && @helps.size > 0
			for help in @helps
				if help.helpie_name != nil
					@helpies.insert(count,help)
					count = count + 1
				elsif help.helper_name != nil
					@helpers.insert(count_h,help)
					count_h = count_h + 1
				end
			end
		end
	end

	def new_helper
		@helper = Help.new
	end

	def new
		@help = Help.new
	end

	def create
		@help = Help.new(help_params)
		@help.user_id = current_user.id
		if @help.save
			redirect_to helps_path
		end
	end

	def edit
		@help = Help.find(params[:id])
	end

	def update
		@help = Help.find(params[:id])
		if @help.update(help_params)
			redirect_to helps_path
		end
	end

	def destroy
		@help = Help.find(params[:id])
		if @help.destroy
			redirect_to helps_path
		end
	end
	private
	def help_params
		params.require(:help).permit(:helper_name,:helper_post,:helper_address,:helper_phone,:helper_email,:helpie_name,:helpie_address,:helpie_phone,:help_title,:help_description,:help_expecation,:user_id)
	end
end
