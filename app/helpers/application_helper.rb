module ApplicationHelper

	def which_user_signed_in?
		if current_user
			current_user.full_name
		# else
		# 	current_admin.full_name
		end
	end

	def max_video_reviewed
		User.joins(:reviews).select("users.*").group('reviews.user_id').order("count(reviews.user_id) DESC").first.reviews.count
	end

end
