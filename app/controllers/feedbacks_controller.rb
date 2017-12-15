class FeedbacksController < ApplicationController

	def show
		@feedback = Feedback.find(params[:id])
	end

	def index
		@ads = Advertise.where(:on_page => "pratikriya_page")
		@summary =  Summary.new
		@summary_exists = Summary.all
		for summary_exist in @summary_exists
			if summary_exist.pratikriya_summary != nil
				@summary_exist = summary_exist
				break
			end
		end
		@feedback = Feedback.new
		@feedbacks = Feedback.all.order("created_at DESC").page(params[:page]).per_page(5)
	end

	def create
		@feedback = Feedback.new(feedback_params)
		if current_user.first_name != nil && current_user.last_name != nil
		@feedback.user_name = current_user.first_name + current_user.last_name
		end
		@feedback.user_id = current_user.id
		if @feedback.save
			redirect_to feedbacks_path
		end
	end



	def destroy
		@feedback = Feedback.find(params[:id])
		if @feedback.destroy
			redirect_to feedbacks_path
		end
	end

	private
	def feedback_params
		params.require(:feedback).permit(:title,:description,:user_id,:user_name)
	end
end
