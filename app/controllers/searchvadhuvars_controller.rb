class SearchvadhuvarsController < ApplicationController
	before_action :authenticate_user!

	def create
		@search_vadhuvar = Searchvadhuvar.new(search_params)
		@search_vadhuvar.user_id = current_user.id
		if @search_vadhuvar.save
			redirect_to search_form_path
		else
			redirect_to search_form_path
			flash[:notice] = "कृपया फॉर्ममध्ये सर्व फील्ड भरा.
किमान लिंग भरा!"
		end
	end
	def update
		@search_vadhuvar = Searchvadhuvar.find(params[:id])
		if @search_vadhuvar.update(search_params)
			redirect_to search_form_path
		else
			redirect_to search_form_path
			flash[:notice] = "कृपया फॉर्ममध्ये सर्व फील्ड भरा.
किमान लिंग भरा!"
		end
	end
	private
	def search_params
		params.require(:searchvadhuvar).permit(:user_id,:age,:color,:gender,:weight,:height,:education)
	end
end
