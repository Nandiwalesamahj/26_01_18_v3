class MessagesController < ApplicationController

		def show
			@message = Message.find(params[:id])
		end
		def new
			@message = Message.new
		end
		def create
			if current_user.user_type == "Super_admin" || current_user.user_type == "Sub_admin"
			@message = Message.new(message_params)
			@message.user_id = current_user.id
			if @message.save
				redirect_to message_path(@message)
			end
			end
		end
		def edit
			@message = Message.find(params[:id])
		end
		def update
			if current_user.user_type == "Super_admin" || current_user.user_type == "Sub_admin"
			@message = Message.find(params[:id])
			if @message.update(message_params)
				redirect_to message_path(@message)
			end
			end
		end
		def destroy
			if current_user.user_type == "Super_admin" || current_user.user_type == "Sub_admin"
			@message = Message.find(params[:id])
			if @message.destroy
				redirect_to homepage_path(current_user)
			end
			end
		end
	
		def download_file
		    @document = Message.find(params[:id])
		      send_file(@document.attachment.path,
		              :disposition => 'attachment',
		              :url_based_filename => false)
		     
		end
	private
	def message_params
		params.require(:message).permit(:title,:user_id, :description,:photo,:attachment)
	end
end
