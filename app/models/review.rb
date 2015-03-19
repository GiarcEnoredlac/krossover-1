class Review < ActiveRecord::Base
	include ApplicationHelper

	belongs_to :user, counter_cache: true

	def ratio_game_length
		self.game_length.to_f / self.review_length.to_f * 100
	end

	def ratio_plays
		self.correct_plays.to_f / self.number_of_plays.to_f * 100
	end

	# def points_earned
	# 	ratio = ratio_game_length * 0.3.to_f
	# 	plays = ratio_plays * 0.3.to_f
	# 	max = (user.reviews.count / max_video_reviewed.to_f) * 0.4.to_f
	# 	ratio + plays + max
	# end

end
