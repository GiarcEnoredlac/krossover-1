class Review < ActiveRecord::Base
	belongs_to :user, counter_cache: true

	def review_count
    self.user.reviews_count
  end

  def sum_game_length
    self.user.reviews.sum(:game_length)  
  end

  def sum_review_length
    self.user.reviews.sum(:review_length) 
  end

  def sum_number_of_plays
    self.user.reviews.sum(:number_of_plays) 
  end

  def sum_correct_plays
    self.user.reviews.sum(:correct_plays) 
  end

	def ratio_game_length
		self.sum_game_length.to_f / self.sum_review_length * 100
	end

	def ratio_plays
		self.sum_correct_plays / self.sum_number_of_plays.to_f * 100
	end

	def video_goal
    10
  end

	def points_earned
		ratio = ratio_game_length * 0.3.to_f
		plays = ratio_plays * 0.3.to_f
		max = ((review_count + 1) / video_goal.to_f) * 40.to_f
		ratio + plays + max
	end

end
