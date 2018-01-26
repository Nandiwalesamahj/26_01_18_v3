class MahatvachevyaktisController < ApplicationController

	def index
		
	end

	def pratishtit_manadal
		@importantpeople = Mahatvachevyakti.where(:importance_type => "प्रतिष्ठीत_मंडळाचे_सदस्य").order("created_at DESC")
	end
	def puraskar_prapt
		@importantpeople = Mahatvachevyakti.where(:importance_type => "पुरस्कार_प्राप्त_व्यक्ती").order("created_at DESC")
	end
	def samajatil_panch
		@importantpeople = Mahatvachevyakti.where(:importance_type => "समाजातील_पंच").order("created_at DESC")
	end
	def uddyojak
		@importantpeople = Mahatvachevyakti.where(:importance_type => "उद्योजक").order("created_at DESC")
	end
	def vyapari
		@importantpeople = Mahatvachevyakti.where(:importance_type => "व्यापारी").order("created_at DESC")
	end
	def sevadatey
		@importantpeople = Mahatvachevyakti.where(:importance_type => "सेवादाते").order("created_at DESC")
	end
	def samaj_bandhav
		@importantpeople = Mahatvachevyakti.where(:importance_type => "समाज_बांधव").order("created_at DESC")
	end
	def shaskiya_karmachari
		@importantpeople = Mahatvachevyakti.where(:importance_type => "शासकीय_कर्मचारी").order("created_at DESC")
	end

	def new
		@person = Mahatvachevyakti.new
	end
	def create
		@person = Mahatvachevyakti.new(mahatvachevyakti_params)
		if user_signed_in?
			if @person.save
				AllMailer.mahatvache_vyakti_new(@person).deliver_now
				redirect_to mahatvachevyakti_home_path
			end
		end
	end
	def edit
		@person = Mahatvachevyakti.find(params[:id])
	end
	def update
		if user_signed_in?
			@person = Mahtvachevyakti.find(params[:id])
			if @person.update(mahatvachevyakti_params)
				redirect_to mahatvachevyakti_home_path
			end
		end
	end
	def destroy
		@person = Mahatvachevyakti.find(params[:id])
		if user_signed_in?
			if @person.destroy
				redirect_to mahatvachevyakti_home_path
			end
		end
	end
	private
	def mahatvachevyakti_params
		params.require(:mahatvachevyakti).permit(:user_name,:photo,:post,:importance_type,:work_field,:phone_number,:address,:gender,:info)		
	end
end
