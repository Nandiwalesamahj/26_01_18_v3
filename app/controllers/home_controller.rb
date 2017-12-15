class HomeController < ApplicationController
	def homepage
		@manogats = Manogat.all.order("created_at ASC")
		for manogat in @manogats
			@manogat = manogat
			break
		end
		@messages = Message.all.order("created_at DESC")
	end

	def rajyasanghatna
		@ads = Advertise.where(:on_page => "rajya_sanghatna_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.Rajya_sanghatna_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
	    @r_members = User.where(:rajya_approval => "Yes").order("created_at DESC").page(params[:page]).per_page(10)
	end
	def zilasanghatna
		@ads = Advertise.where(:on_page => "zilla_sanghatna_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.Zilla_sanghatna_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
	    @r_members = User.where(:zilla_approval => "Yes").order("created_at DESC")
	end
	def yuvasanghatna
		@ads = Advertise.where(:on_page => "yuva_sanghatna_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.Yuva_sanghatna_summary != nil
				@summary_exist = summary_exist
				break
			end
		end

	    @r_members = User.where(:yuva_approval => "Yes").order("created_at DESC").page(params[:page]).per_page(10)
	end
	def dharmik_places
		@ads = Advertise.where(:on_page => "dharmik_places_home")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.Dharmik_places_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@dharmik_places = Samajikplace.all.order("created_at DESC").page(params[:page]).per_page(10)
		@dharmik_place = Samajikplace.new
	end
	def sanghatnaactivities
		@ads = Advertise.where(:on_page => "sanghatna_karya_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.Sanghatna_activity_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@sanghatnaactivities = Sanghatnaactivity.all.order("created_at DESC")
		@sanghatnaactivity = Sanghatnaactivity.new
	end
	def vadhuvar
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.Vadhuvar_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@vadhuvars = Vadhuvar.all.order("created_at DESC")
		@vadhuvar = Vadhuvar.new
		if user_signed_in?
		@vadhuvar_passes = Vadhuvar.where(:user_id => current_user.id)
		for vadhuvar_pass in @vadhuvar_passes
				@vadhuvar_pass = vadhuvar_pass
				break
		end
	end
	end

	def tanta_mukti_samiti
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.Tantamukti_summary != nil
				@summary_exist = summary_exist
				break
			end
		end

		@tantamuktis = Tantamukti.all.order("created_at DESC")
		@tantamukti = Tantamukti.new
		if user_signed_in?
		@tantamukti_passes = Tantamukti.where(:user_id => current_user.id)
		for tantamukti_pass in @tantamukti_passes
				@tantamukti_pass = tantamukti_pass
				break
			end
		end
	end
	def mahatvachevyakti
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.important_people_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@importantpeople = Mahatvachevyakti.all.order("created_at DESC").page(params[:page]).per_page(10)
		@importantperson = Mahatvachevyakti.new
	end
	def future_vision
		@ads = Advertise.where(:on_page => "bhavishyatil_dhyeya_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.future_vision_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@visions = Vision.all.order("created_at ASC")
		@vision = Vision.new
	end
	def karmachari_bharti
		@recruitment = Recruitment.new
		if user_signed_in?
		@user_recruitment = Recruitment.where(:user_id => current_user.id)
		if @user_recruitment != nil && @user_recruitment.size > 0
			for user_recruitment in @user_recruitment
				@user_recruitment_pass = user_recruitment
				break
			end
		end
	end
	end
	
end
