class VideoReviewsController < ApplicationController

	def new
		@review = current_user.video_reviews.new
	end

	def create
		@review = current_user.video_reviews.new(video_reviews_params)
		if @review.save
			redirect_to :back
		else
			render 'new'
		end
	end

	private
	def video_reviews_params
		params.require(:video_review).permit(:user_id, :title)
	end

end
