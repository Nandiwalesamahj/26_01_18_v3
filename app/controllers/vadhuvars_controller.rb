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
				AllMailer.vadhuvar_new(@vadhuvar).deliver_now
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
	def search_form
		@flag = 0
		if user_signed_in? && (current_user.user_type == "Super_admin" || current_user.user_type == "Admin" )
		@search  = Searchvadhuvar.where(:user_id => current_user.id)

			if @search.size <= 0
			@search_vadhuvar =Searchvadhuvar.new
			else
				for search in @search
					@search_vadhuvar_update = search
					@flag = 1
					break
				end
			end
		end
	end
	def show_super
		@id = params[:passed_id].to_i
		@vadhuvars = Vadhuvar.where(:id => @id )
		if @vadhuvars.size > 0	
			for vad in @vadhuvars
				@vadhuvar = vad
				break
			end
		end
	end
	def search_result
		@search_vadhuvar = Searchvadhuvar.find(params[:passed_search])
		@vadhuvars =  Array.new
		@vadhuvar_dummy = Array.new
		
		if @search_vadhuvar.gender != nil

			@vadhuvar_n = Vadhuvar.where(:gender => @search_vadhuvar.gender)
			
			if @search_vadhuvar.education != nil
				if @vadhuvar_n.size > 0
					count = 0
					for v in @vadhuvar_n
						if v.education == @search_vadhuvar.education
						@vadhuvar_dummy.insert(count,v)
						@vadhuvars.insert(count,v)
						count = count + 1
						end
					end
					if @vadhuvars.size > 0
						@vadhuvar_dummy.clear
						@vadhuvar_dummy = @vadhuvars.dup
						@vadhuvars.clear
					else
						if @vadhuvar_n.size > 0
							count = 0
							for v in @vadhuvar_n
								@vadhuvar_dummy.insert(count,v)
								count = count + 1
							end	
							count = 0
						end
					end
				end
			end


			if @search_vadhuvar.color != nil
				if @vadhuvar_dummy.size > 0
					count = 0
					for v in @vadhuvar_dummy
						if v.color == @search_vadhuvar.color
						@vadhuvars.insert(count,v)
						count = count + 1
						end
					end
					if @vadhuvars.size > 0
						@vadhuvar_dummy.clear
						@vadhuvar_dummy = @vadhuvars.dup
						@vadhuvars.clear
					else
						@vadhuvars.clear
					end
				end
			end

			if @search_vadhuvar.age != nil
				if @vadhuvar_dummy.size > 0
					count = 0
					for v in @vadhuvar_dummy
						if v.age > @search_vadhuvar.age - 2 && v.age < @search_vadhuvar.age + 2
							@vadhuvars.insert(count,v)
							count = count + 1
						 end
					end
					if @vadhuvars.size > 0
						@vadhuvar_dummy.clear
						@vadhuvar_dummy = @vadhuvars.dup
						@vadhuvars.clear
					else
						@vadhuvars.clear
					end
				end
			end


			if @search_vadhuvar.height != nil
				if @vadhuvar_dummy.size > 0
					count = 0
					for v in @vadhuvar_dummy
						if v.height.to_i > (@search_vadhuvar.height.to_i - 5) && v.height.to_i < (@search_vadhuvar.height.to_i + 5)
							@vadhuvars.insert(count,v)
							count = count + 1
						 end
					end
					if @vadhuvars.size > 0
						@vadhuvar_dummy.clear
						@vadhuvar_dummy = @vadhuvars.dup
						@vadhuvars.clear
					else
						@vadhuvars.clear
					end

				end
			end


			if @search_vadhuvar.weight != nil
				if @vadhuvar_dummy.size > 0
					count = 0
					for v in @vadhuvar_dummy
						if v.weight > (@search_vadhuvar.weight - 5) && v.weight < (@search_vadhuvar.weight + 5)
							@vadhuvars.insert(count,v)
							count = count + 1
						 end
					end
					if @vadhuvars.size > 0
						@vadhuvar_dummy.clear
						@vadhuvar_dummy = @vadhuvars.dup
						@vadhuvars.clear
					else
						@vadhuvars.clear
					end

				end
			end
			@vadhuvars = @vadhuvar_dummy.dup

		end
	end

	private
	def vadhuvar_params
		params.require(:vadhuvar).permit(:vadhuvar_name,:birth_date,:height,:weight,:education,:blood_group,:phone_number,:expecations,:salary,:occupation,:father_name,:mother_name,:uncle_name,:address,:sub_caste,:photo,:bio,:vadhuvar_approval,:user_id,:gender,:vadhuvar_sirname,:color,:age,:exp_color,:exp_age,:exp_height,:exp_education,:exp_weight,:public)
	end
end


