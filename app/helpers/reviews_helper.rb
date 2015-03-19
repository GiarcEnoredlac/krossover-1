module ReviewsHelper

	def game_length_percentage(review)
		number_to_percentage(review.ratio_game_length, precision: 0)
	end

	def correct_play_percentage(review)
		number_to_percentage(review.ratio_plays, precision: 0)
	end

	

end
