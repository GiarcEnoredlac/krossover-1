class ReviewsController < ApplicationController

	def index
		@reviews = Review.all
	end

	def show
	end

	def edit
	end

	def new
		@review = current_user.reviews.new
	end

	def create
		@review = current_user.reviews.new(reviews_params)
		if @review.save
			redirect_to :back
		else
			render 'new'
		end
	end

	def update
	end

	def destroy
	end

	private
	def reviews_params
		params.require(:review).permit(:user_id, :title)
	end

end
