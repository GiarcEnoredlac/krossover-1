class ReviewsController < ApplicationController
	before_action :authenticate_user!

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
			current_user.update(leaderboard_points: @review.points_earned)
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
		params.require(:review).permit(:title, 
																	 :game_length, 
																	 :review_length, 
																	 :number_of_plays, 
																	 :correct_plays)
	end

end
