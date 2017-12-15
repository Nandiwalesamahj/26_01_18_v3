class ImportantaffairsController < ApplicationController
	

	def index
		@importantaffair = Importantaffair.all.order("creaed_at DESC")
	end
	def new
		@importantaffair = Importantaffair.new
	end
	def create
		@importantaffair = Importantaffair.new(important_affair_params)
		if @importantaffair.save
		end
	end
	def edit
		@importantaffair = Importantaffair.find(params[:id])
	end
	def update
		@importantaffair = Importantaffair.find(params[:id])
		if @importantaffair.update(important_affair_params)
		end
	end
	def destroy
		@importantaffair = Importantaffair.find(params[:id])
		if @importantaffair.destroy
		end
	end
	private
	def important_affair_params
		params.require(:importantaffair).permit(:title,:description)		
	end
end

