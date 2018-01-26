class ExcelattachesController < ApplicationController
	def create
		if current_user.user_type == "Super_admin"
			@attach = Excelattach.new(excel_params)
			@attach.user_id = current_user.id
			if @attach.save
				redirect_to mahatvachevyakti_home_path
			end
		end
	end
	def download_file_excel
		    @document = Excelattach.find(params[:id])
		      send_file(@document.excel.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
	end
	private
	def excel_params
		params.require(:excelattach).permit(:excel,:user_id)
	end
end
